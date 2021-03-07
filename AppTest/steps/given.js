import { Given } from 'cucumber';


Given('user opens the AeroPlatzi homepage', function (site) {
    browser.url('./');
});