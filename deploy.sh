#!/bin/bash

# Deployment script for Stock Trader Information App
# This script helps you deploy to Render.com (easiest option)

echo "🚀 Stock Trader Information - Deployment Helper"
echo "================================================"
echo ""

# Check if code is pushed to GitHub
echo "📦 Step 1: Checking GitHub connection..."
if git remote get-url origin &>/dev/null; then
    echo "✅ GitHub remote configured: $(git remote get-url origin)"
    echo ""
    echo "Making sure all changes are committed and pushed..."
    
    # Check for uncommitted changes
    if ! git diff-index --quiet HEAD --; then
        echo "⚠️  You have uncommitted changes. Committing them now..."
        git add .
        git commit -m "Update before deployment"
    fi
    
    # Check if we need to push
    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse @{u} 2>/dev/null || echo "")
    
    if [ -z "$REMOTE" ] || [ "$LOCAL" != "$REMOTE" ]; then
        echo "📤 Pushing to GitHub..."
        git push origin main
        if [ $? -eq 0 ]; then
            echo "✅ Code pushed to GitHub successfully!"
        else
            echo "❌ Failed to push to GitHub. Please check your credentials."
            exit 1
        fi
    else
        echo "✅ Code is up to date on GitHub"
    fi
else
    echo "❌ No GitHub remote found. Please set up GitHub first."
    exit 1
fi

echo ""
echo "================================================"
echo "🎯 Deployment Options:"
echo ""
echo "1. Render.com (Recommended - Free, Easy)"
echo "2. Fly.io (Free, Fast)"
echo "3. Railway (Simple, $5/month credit)"
echo ""
echo "================================================"
echo ""
echo "📋 Quick Deploy Instructions for Render.com:"
echo ""
echo "1. Go to: https://render.com"
echo "2. Sign up/Login with GitHub"
echo "3. Click 'New +' → 'Web Service'"
echo "4. Connect your repository: $(git remote get-url origin | sed 's/.*\///' | sed 's/\.git$//')"
echo "5. Configure:"
echo "   - Name: stock-info-app (or any name)"
echo "   - Environment: Python 3"
echo "   - Build Command: pip install -r requirements.txt"
echo "   - Start Command: gunicorn app:app --bind 0.0.0.0:\$PORT"
echo "   - Plan: Free"
echo "6. Click 'Create Web Service'"
echo "7. Wait 5-10 minutes for deployment"
echo "8. Your site will be live at: https://your-app-name.onrender.com"
echo ""
echo "================================================"
echo ""
echo "📋 Quick Deploy Instructions for Fly.io:"
echo ""
echo "1. Install Fly CLI:"
echo "   curl -L https://fly.io/install.sh | sh"
echo ""
echo "2. Sign up:"
echo "   fly auth signup"
echo ""
echo "3. Deploy:"
echo "   cd /Users/shashy/Desktop/stock-trader-information"
echo "   fly launch"
echo "   (Follow prompts, use existing fly.toml)"
echo "   fly deploy"
echo ""
echo "4. Your site will be live at: https://your-app-name.fly.dev"
echo ""
echo "================================================"
echo ""
echo "✅ Your code is ready for deployment!"
echo "📚 For detailed instructions, see DEPLOYMENT_GUIDE.md"
echo ""
