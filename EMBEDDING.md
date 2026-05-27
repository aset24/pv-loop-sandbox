# Embedding the PV loop sandbox in PowerPoint for Mac

Three ways to put `pv_loop_sandbox.html` inside a slide. Pick based on whether
your institution allows Office add-ins and whether you can rely on conference
WiFi.

| Method | Add-ins allowed? | Works offline? | Best for |
|---|:---:|:---:|---|
| **A. Web Viewer add-in + GitHub Pages** | yes | no | a normal talk on hospital WiFi |
| **B. Hyperlinked slide → local file** | yes or no | yes | conference, hostile WiFi, USB stick |
| **C. Web Viewer pointed at a local file** | yes | yes-ish | advanced; works in tests, may fail in some setups |

If you don't know which to use, set up Method B as a fallback no matter what.
It is the only one that survives a dead network and a locked-down laptop.

---

## Method A — Web Viewer add-in + GitHub Pages (recommended)

### 1. Install the Web Viewer add-in (one-off, ~2 minutes)

1. Open PowerPoint for Mac.
2. **Insert → Get Add-ins** (older builds: **Insert → Store**).
3. Search for **Web Viewer** (published by Microsoft Corporation).
4. Click **Add** and accept the terms.
5. The add-in now lives under **Insert → My Add-ins → Web Viewer**.

If "Get Add-ins" is greyed out or returns "your administrator has disabled
this", your institution blocks the add-in store and you cannot use this
method. Skip to Method B.

### 2. Host `pv_loop_sandbox.html` on GitHub Pages (one-off, ~5 minutes)

The Web Viewer add-in requires an **HTTPS URL**. GitHub Pages gives you one
for free.

1. Create a free GitHub account if you don't have one.
2. Create a new public repository — e.g. `pv-loop-sandbox`.
3. From this folder, push the file:

   ```sh
   git remote add origin https://github.com/<your-username>/pv-loop-sandbox.git
   git branch -M main
   git push -u origin main
   ```

4. On GitHub, go to **Settings → Pages**. Under **Source**, select **Deploy
   from a branch**, set branch to **main** and folder to **/ (root)**. Save.
5. Wait ~60 seconds. The page settings will show a URL like
   `https://<your-username>.github.io/pv-loop-sandbox/`.
6. The file URL is that plus the filename:
   `https://<your-username>.github.io/pv-loop-sandbox/pv_loop_sandbox.html`.
   Open it in Safari to confirm it loads.

### 3. Point Web Viewer at the URL

1. On the slide where you want the tool, **Insert → My Add-ins → Web Viewer**.
2. A box appears on the slide. Click **Set URL**.
3. Paste your GitHub Pages URL **without the `https://` prefix** — Web Viewer
   adds it back. So enter `your-username.github.io/pv-loop-sandbox/pv_loop_sandbox.html`.
4. Click **Preview**. The loop should render inside the box.
5. Resize the box to taste. The tool's responsive layout will reflow from
   single-column (narrow) to two-column (wide) at ~1100 px.
6. **Important:** the embed only becomes interactive in **Slideshow mode**.
   In normal editing view you will see the rendered tool but cannot drag
   the sliders. Press ⌘⇧↵ (or **Play From Current Slide**) to test.

### Tips for Method A
- Updates to the file: push to `main`, wait ~60 seconds, hit refresh inside
  the Web Viewer (right-click the embed → **Reload**).
- The presenter keyboard shortcuts (`1`–`9`, `←`/`→`) only fire when the
  Web Viewer iframe has focus. Click once inside the embed at the start of
  the slide to focus it, then your keys work.

---

## Method B — Hyperlink from a slide (works offline; no add-ins needed)

Use this when add-ins are blocked, when WiFi is unreliable, or as a backup
for Method A.

### 1. Put the file somewhere your laptop can reach offline
The simplest options:
- Leave it in this Dropbox folder (the file is offline-available if the
  folder is marked "Available offline").
- Copy it to your laptop's Desktop or Documents.
- Drop it on a USB stick.

### 2. Add a hyperlink on a slide
1. Insert a text box, shape, or button on the slide — something the
   audience will see you click (e.g. a "Launch PV loop" button).
2. Right-click → **Hyperlink → Web Page or File…**.
3. **Select…** → browse to `pv_loop_sandbox.html` → **Open**.
4. **OK** to close the dialog.

### 3. During the talk
1. In Slideshow mode, click the hyperlink. Safari (or your default browser)
   opens with the tool full-window.
2. Teach with the tool. The keyboard shortcuts (`1`–`9`, `←`/`→`) all work.
3. When done, **⌘ + tab** back to PowerPoint and continue the slideshow.

### Tips for Method B
- Make Safari your default browser (System Settings → Desktop & Dock →
  Default web browser) so the hyperlink opens in the same engine PowerPoint
  uses, not Chrome.
- Test the hyperlink in Slideshow mode **before the talk**. PowerPoint
  sometimes prompts "are you sure?" on first-use of a hyperlink in a deck;
  it remembers your answer after that.
- If the file path contains spaces (this Dropbox folder does), PowerPoint
  handles it correctly — but if you ever copy the file elsewhere, prefer a
  path without spaces.

---

## Method C — Web Viewer pointed at a local file (advanced)

You can paste a `file://` URL into Web Viewer instead of a GitHub Pages URL.
In some Mac builds this works; in others Web Viewer refuses anything that
isn't HTTPS. Worth trying as a fallback, but **don't rely on it for a talk
without testing on the exact laptop you'll present from**.

The URL format is `file:///Users/<you>/path/to/pv_loop_sandbox.html` (three
slashes). If Web Viewer accepts it, the embed becomes interactive in
Slideshow mode exactly like Method A. If it refuses, you'll see a blank box.

---

## Quick troubleshooting

**The embed is blank in editing view.**
Expected. Web Viewer only renders in Slideshow mode. Press ⌘⇧↵.

**The sliders don't respond to keyboard shortcuts.**
Click once inside the embed in Slideshow mode to give it focus, then `1`–`9`
and arrow keys will work.

**The loop is squashed or oversized.**
The embed box on the slide is too small or oddly proportioned. Resize so
the box is at least ~700 px wide; the tool will pick single-column or
two-column layout based on its width.

**GitHub Pages says "404" for ~5 minutes after first deploy.**
Normal. Wait, then refresh.

**Conference WiFi fails mid-talk and Method A breaks.**
The Method B hyperlink on the same slide still works because the file is
local. This is why setting both up is a good idea.
