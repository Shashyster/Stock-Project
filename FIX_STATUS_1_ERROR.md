# 🔧 Fix "Exited with Status 1" Error on Render

## ⚠️ The Problem

Your Render deployment keeps failing with **"exited with status 1"** error.

## 🔍 Common Causes

1. **Build command fails** - Dependencies can't be installed
2. **Start command fails** - App can't start
3. **Missing files** - Templates or static folders not found
4. **Python version mismatch** - Wrong Python version
5. **Root directory wrong** - Files in wrong location

## ✅ FIXED Configuration

I've updated your files. Here's what changed:

### 1. Updated `requirements.txt`
- Added `Werkzeug>=2.3.0` (required for Flask)

### 2. Updated `render.yaml`
- Better build command: `pip install --upgrade pip && pip install -r requirements.txt`
- Better start command with workers and timeout
- Added PORT environment variable

## 🚀 Deploy Steps

### Step 1: Push Updated Files

```bash
cd /Users/shashy/Desktop/stock-trader-information
git add requirements.txt render.yaml
git commit -m "Fix deployment configuration"
git push origin main
```

### Step 2: Update Render Settings

1. Go to: https://dashboard.render.com
2. Click on your service
3. Go to **Settings** → **Build & Deploy**

**VERIFY THESE SETTINGS:**

**Build & Deploy:**
- **Build Command:** `pip install --upgrade pip && pip install -r requirements.txt`
- **Start Command:** `gunicorn app:app --bind 0.0.0.0:$PORT --workers 2 --timeout 120`

**Environment:**
- **Python Version:** `3.11.0` (or leave auto)
- **Root Directory:** 
  - If `app.py` is in repo root: **EMPTY**
  - If `app.py` is in `stock-trader-information/`: `stock-trader-information`

**Environment Variables:**
- `FLASK_ENV` = `production`
- `PORT` = `10000` (or leave Render to set automatically)

### Step 3: Manual Deploy

1. Click **Manual Deploy** → **Deploy latest commit**
2. Watch the **Logs** tab
3. Look for errors

## 🔍 Check Build Logs

After deployment starts, check logs for:

**✅ Good signs:**
```
Installing dependencies...
Successfully installed Flask-3.x.x
Starting gunicorn...
```

**❌ Bad signs:**
```
ERROR: Could not find a version that satisfies...
ModuleNotFoundError: No module named...
FileNotFoundError: [Errno 2] No such file or directory
```

## 🎯 Most Common Fixes

### Fix 1: Root Directory

**If your code is in a subfolder:**
- Set **Root Directory** to: `stock-trader-information`
- Save and redeploy

**If your code is in repo root:**
- Set **Root Directory** to: **EMPTY**
- Save and redeploy

### Fix 2: Build Command

Use this exact build command:
```bash
pip install --upgrade pip && pip install -r requirements.txt
```

### Fix 3: Start Command

Use this exact start command:
```bash
gunicorn app:app --bind 0.0.0.0:$PORT --workers 2 --timeout 120
```

### Fix 4: Check File Structure

Make sure these files exist in your repo:
- ✅ `app.py` (in root or subfolder)
- ✅ `requirements.txt`
- ✅ `templates/index.html`
- ✅ `static/style.css`
- ✅ `static/script.js`

## 🆘 Still Getting Errors?

### Check the Logs

1. Go to Render Dashboard
2. Your Service → **Logs** tab
3. Scroll to find the error
4. Look for:
   - `ERROR:`
   - `ModuleNotFoundError:`
   - `FileNotFoundError:`
   - `ImportError:`

### Common Error Messages

**"ModuleNotFoundError: No module named 'flask'"**
- Fix: Check build command is correct
- Fix: Verify requirements.txt has Flask

**"FileNotFoundError: templates/index.html"**
- Fix: Check Root Directory setting
- Fix: Verify templates folder exists

**"gunicorn: command not found"**
- Fix: Check requirements.txt has gunicorn
- Fix: Verify build completed successfully

**"Address already in use"**
- Fix: This is normal, Render handles ports automatically

## ✅ Success Indicators

When it works, logs will show:
```
[INFO] Starting gunicorn 21.x.x
[INFO] Listening at: http://0.0.0.0:10000
[INFO] Application startup complete
```

And your site will show:
- ✅ "Stock Intelligence Platform" header
- ✅ Dark theme interface
- ✅ Working stock search

---

## Quick Checklist

- [ ] Updated `requirements.txt` pushed to GitHub
- [ ] Updated `render.yaml` pushed to GitHub
- [ ] Root Directory set correctly in Render
- [ ] Build Command: `pip install --upgrade pip && pip install -r requirements.txt`
- [ ] Start Command: `gunicorn app:app --bind 0.0.0.0:$PORT --workers 2 --timeout 120`
- [ ] Python Version: 3.11.0 (or auto)
- [ ] Manual deploy triggered
- [ ] Checked logs for errors

---

**The files are fixed. Push to GitHub and update Render settings!**
