#!/bin/bash

# Quick script to connect to new Stock-Analysis repository

echo "🚀 Setting up new repository: Stock-Analysis"
echo ""

# Get GitHub username
read -p "Enter your GitHub username: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ GitHub username is required!"
    exit 1
fi

echo ""
echo "📦 Step 1: Removing old remote..."
git remote remove origin 2>/dev/null || echo "No old remote found"

echo "📦 Step 2: Adding new remote..."
git remote add origin "https://github.com/${GITHUB_USERNAME}/Stock-Analysis.git"

echo "📦 Step 3: Checking status..."
git status

echo ""
echo "✅ Repository connected!"
echo ""
echo "Next steps:"
echo "1. Make sure your new repository exists on GitHub:"
echo "   https://github.com/${GITHUB_USERNAME}/Stock-Analysis"
echo ""
echo "2. Push your code:"
echo "   git push -u origin main"
echo ""
echo "3. Deploy on Railway:"
echo "   https://railway.app/new"
echo "   Select: ${GITHUB_USERNAME}/Stock-Analysis"
echo ""
