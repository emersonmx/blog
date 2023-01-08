const path = require('path');
const themeDir = path.resolve(__dirname);

const tailwindConfig = path.resolve(themeDir, "tailwind.config.js");

module.exports = {
    plugins: [
        require('tailwindcss')(tailwindConfig),
        require('autoprefixer'),
    ]
}
