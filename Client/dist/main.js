import axios from 'axios';
async function loadForecast() {
    try {
        const { data } = await axios.get('/weatherforecast');
        const output = document.getElementById('output');
        if (output) {
            output.textContent = JSON.stringify(data, null, 2);
        }
    }
    catch (err) {
        console.error('Failed to load forecast', err);
    }
}
loadForecast();
