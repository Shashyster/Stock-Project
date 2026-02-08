# 🚀 Setup New Repository: Stock Analysis

## Step 1: Connect Your Local Code to New Repository

### Option A: If repository is empty (Recommended)

```bash
cd /Users/shashy/Desktop/stock-trader-information

# Remove old remote (if exists)
git remote remove origin

# Add your new repository
git remote add origin https://github.com/YOUR_USERNAME/Stock-Analysis.git

# Push all code
git push -u origin main
```

**Replace `YOUR_USERNAME` with your GitHub username!**

### Option B: If repository already has files

```bash
cd /Users/shashy/Desktop/stock-trader-information

# Remove old remote
git remote remove origin

# Add new repository
git remote add origin https://github.com/YOUR_USERNAME/Stock-Analysis.git

# Pull and merge (if needed)
git pull origin main --allow-unrelated-histories

# Push your code
git push -u origin main
```

---

## Step 2: Verify Everything is Pushed

```bash
git log --oneline -3
git remote -v
```

You should see:
- Your commits
- Remote pointing to `Stock-Analysis`

---

## Step 3: Deploy on Railway (Easiest!)

1. **Go to:** https://railway.app/new
2. **Click:** "Deploy from GitHub repo"
3. **Select:** `YOUR_USERNAME/Stock-Analysis`
4. **Wait 2 minutes**
5. **Done!** Your site URL appears

**Railway auto-detects everything!**

---

## Step 4: Alternative - Deploy on PythonAnywhere

1. **Go to:** https://www.pythonanywhere.com
2. **Sign up** (free account)
3. **Bash tab** → Run:
   ```bash
   git clone https://github.com/YOUR_USERNAME/Stock-Analysis.git
   cd Stock-Analysis/stock-trader-information
   pip3.10 install --user -r requirements.txt
   ```
4. **Web tab** → "Add a new web app" → Flask → Python 3.10
5. **Source code:** `/home/YOUR_USERNAME/Stock-Analysis/stock-trader-information`
6. **WSGI file** → Edit and paste:
   ```python
   import sys
   path = '/home/YOUR_USERNAME/Stock-Analysis/stock-trader-information'
   if path not in sys.path:
       sys.path.append(path)
   from app import app as application
   ```
7. **Web tab** → Click **"Reload"**
8. **Done!** Site: `https://YOUR_USERNAME.pythonanywhere.com`

---

## ✅ Quick Checklist

- [ ] New repository created on GitHub: `Stock-Analysis`
- [ ] Local code connected to new repo
- [ ] Code pushed to GitHub
- [ ] Deployed on Railway or PythonAnywhere
- [ ] Site is live!

---

**Next: Connect your code to the new repo, then deploy on Railway!**
