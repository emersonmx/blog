const path = require('path');
const themeDir = path.resolve(__dirname);

module.exports = {
    content: [path.resolve(themeDir, 'layouts/**/*.html')],
    theme: {
        fontFamily: {
            mono: ['"MesloLGS NF"', 'monospace']
        }
    },
    plugins: []
};
