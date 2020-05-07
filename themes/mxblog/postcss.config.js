const purgecss = require("@fullhuman/postcss-purgecss");
const postcssPresetEnv = require("postcss-preset-env");

module.exports = {
    plugins: [
        require("postcss-import"),
        postcssPresetEnv({
            stage: 3,
            features: {
                "nesting-rules": true,
                "custom-properties": true,
            },
        }),
        require("tailwindcss"),
        ...(process.env.NODE_ENV == "production"
            ? [purgecss({ content: ["./dist/**/*.html"] })]
            : []),
    ],
};
