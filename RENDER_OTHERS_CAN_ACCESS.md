# Fix: Others Can't See Your Render Site

## 1. Use the production server (required)

Your Render logs show: **"Running 'python app.py'"** and a warning about the development server. That can cause unreliable access for others.

**In Render Dashboard:**

1. Open your **Stock-Project** service.
2. Go to **Settings** (left sidebar).
3. Under **Build & Deploy**, find **Start Command**.
4. Set it to exactly:
   ```bash
   gunicorn app:app --bind 0.0.0.0:$PORT
   ```
5. Save. Render will **redeploy** automatically.

After this, logs should show `gunicorn` instead of `python app.py`, and the "development server" warning will be gone.

---

## 2. Free tier "cold start" — ERR_TIMED_OUT for others

On Render’s **free** plan, your app is put to **sleep** after about **15 minutes** of no traffic. The first request after that has to **wake** the server; that can take **50–90+ seconds**. Most browsers (e.g. Chrome) **time out** after ~30–60 seconds and show **"This site can't be reached... took too long to respond" (ERR_TIMED_OUT)**. So your friend’s browser gives up before Render finishes waking up. It works for you because you often visit when the instance is already awake.

**Best fix: keep the app awake with a free ping (recommended)**

Use a free uptime monitor to hit your URL every 5–10 minutes. Then the service rarely (or never) sleeps, and when your friend opens the link it responds in 1–2 seconds with no timeout.

**UptimeRobot (free):**

1. Go to **[uptimerobot.com](https://uptimerobot.com)** and create a free account.
2. Click **+ Add New Monitor**.
3. Set:
   - **Monitor Type:** HTTP(s)
   - **Friendly Name:** e.g. `Stock-Project`
   - **URL:** `https://stock-project-1g7u.onrender.com`
   - **Monitoring Interval:** 5 minutes (or 10 if 5 isn’t available on free tier).
4. Click **Create Monitor**.

UptimeRobot will request your URL every 5–10 minutes, so Render keeps the instance running and your friend (and you) get fast loads with no ERR_TIMED_OUT.

**Other options:**

- **Tell friends to retry:** First visit might time out; ask them to click **Reload** once or twice and wait 60–90 seconds. Less reliable.
- **Paid plan:** Render’s paid plans keep the service always on, so no cold start.

---

## 3. Make sure they’re really opening your URL

If your friend’s browser shows **about:blank** in the address bar, that’s a **new blank tab**, not your site. They need to:

1. Paste: `https://stock-project-1g7u.onrender.com`
2. Press Enter.
3. Wait 30–60 seconds on first load (free tier).

---

## Summary

| Step | Action |
|------|--------|
| 1 | In Render → Settings → set **Start Command** to `gunicorn app:app --bind 0.0.0.0:$PORT` and let it redeploy. |
| 2 | Tell others to wait **30–60 seconds** on first visit (free tier cold start). |
| 3 | Optionally use UptimeRobot to ping your URL every 10–15 min so it stays awake. |
| 4 | Confirm they’re actually opening your URL (not a blank tab). |
