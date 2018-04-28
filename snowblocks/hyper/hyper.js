const colors = {
  black: "#e7e5e2",
  red: "#aa586e",
  green: "#608f8e",
  yellow: "#447487",
  blue: "#56759a",
  magenta: "#7c6a93",
  cyan: "#a05b89",
  white: "#697383",
  colorCubes: "#dfddd7",
  grayscale: "#929cad"
};

module.exports = {
  config: {
    shell: "fish",
    fontSize: 13,
    fontFamily: "Iosevka, monospace",
    uiFontFamily: "Iosevka, monospace",
    padding: "0 0",
    cursorShape: "BLOCK",
    cursorColor: colors.white,
    cursorAccentColor: colors.black,
    backgroundColor: colors.white,
    foregroundColor: colors.black,
    selectionColor: colors.colorCubes,
    borderColor: colors.grayscale,
    colors: {
      ...colors,
      lightBlack: colors.black,
      lightRed: colors.red,
      lightGreen: colors.green,
      lightYellow: colors.yellow,
      lightBlue: colors.blue,
      lightMagenta: colors.magenta,
      lightCyan: colors.cyan,
      lightWhite: colors.white
    }
  },

  plugins: ["hyperminimal"],
  localPlugins: [],

  keymaps: {}
};
