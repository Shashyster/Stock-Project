# ⚡ Quick Start: Deploy Your App in 5 Minutes

## 🎯 Fastest Way: Render.com

### Step 1: Push to GitHub (if needed)
```bash
cd /Users/shashy/Desktop/stock-trader-information
git add .
git commit -m "Ready for deployment"
git push origin main
```
*(You'll be prompted for GitHub credentials)*

### Step 2: Deploy on Render

1. **Go to:** https://render.com
2. **Sign up** with GitHub (one click)
3. **Click:** "New +" → "Web Service"
4. **Select:** Your repo `Shashyster/AI-Stock-Agent`
5. **Configure:**
   - Name: `stock-info-app`
   - Build: `pip install -r requirements.txt`
   - Start: `gunicorn app:app --bind 0.0.0.0:$PORT`
   - Plan: `Free`
6. **Click:** "Create Web Service"
7. **Wait:** 5-10 minutes
8. **Done!** Your site: `https://stock-info-app.onrender.com`

---

## 🚀 That's It!

Your app is now live on the internet! Share the URL with anyone.

**For detailed instructions, see `GO_LIVE.md`**
