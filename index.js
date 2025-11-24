// index.js
import puppeteer from 'puppeteer';

(async () => {
  const browser = await puppeteer.launch({
    headless: "new",
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
      '--disable-dev-shm-usage',
      '--disable-gpu',
      '--single-process',   // 可选，Alpine 下能进一步省内存
    ],
  });

  const page = await browser.newPage();
  await page.goto('https://httpbin.org/html');
  await page.screenshot({ path: 'screenshot.png' });
  console.log('截图成功：screenshot.png');

  await browser.close();
})();
