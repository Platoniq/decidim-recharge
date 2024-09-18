// This file is automatically generated.
// Do not edit this file, it will be overwritten
//
// If you want to modify it, follow instructions from
// https://docs.decidim.org/en/develop/customize/styles
//

const { inherit, current, transparent, white } = require("tailwindcss/colors")

const withOpacity =
  (variable) =>
  ({ opacityValue }) =>
    opacityValue === undefined
      ? `rgb(var(${variable}))`
      : `rgb(var(${variable}) / ${opacityValue})`;

module.exports = {
  // This content is generated automatically by decidim:webpacker:install task, it
  // should not be updated manually.
  // The array must contain all the decidim modules active in the application
  content: ['/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-core-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-comments-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-accountability-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-admin-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-api-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-assemblies-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-blogs-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-budgets-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-debates-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-forms-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-generators-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-meetings-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-pages-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-participatory_processes-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-proposals-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-sortitions-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-surveys-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-system-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-templates-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-verifications-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/bundler/gems/decidim-module-alternative_landing-392214538be7','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-conferences-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/bundler/gems/decidim-module-decidim_awesome-84374037d34a','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/decidim-dev-0.28.2','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/bundler/gems/decidim-module-extra_user_fields-c1d8eb2dab4e','/home/platoniq/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/bundler/gems/decidim-module-term_customizer-9133eea57ebf','.'].flatMap(directory => [
    `${directory}/app/views/**/*.html.erb`,
    `${directory}/app/cells/**/*.{rb,erb}`,
    `${directory}/app/helpers/**/*.rb`,
    `${directory}/app/packs/**/*.js`,
    `${directory}/lib/**/*.rb`
  ]),
  // Comment out the next line to disable purging the tailwind styles
  // safelist: [{ pattern: /.*/ }],
  theme: {
    colors: {
      inherit,
      current,
      transparent,
      white,
      primary: withOpacity("--primary-rgb"),
      secondary: withOpacity("--secondary-rgb"),
      tertiary: withOpacity("--tertiary-rgb"),
      success: withOpacity("--success-rgb"),
      alert: withOpacity("--alert-rgb"),
      warning: withOpacity("--warning-rgb"),
      black: "#020203",
      gray: {
        DEFAULT: "#6B7280CC", // 80% opacity
        2: "#3E4C5C",
        3: "#E1E5EF",
        4: "#242424",
        5: "#F6F8FA"
      },
      background: {
        DEFAULT: "#F3F4F7",
        2: "#FAFBFC",
        3: "#EFEFEF",
        4: "#E4EEFF99" // 60% opacity
      }
    },
    container: {
      center: true,
      padding: {
        DEFAULT: "1rem",
        lg: "4rem"
      }
    },
    fontFamily: {
      sans: ["Source Sans Pro", "ui-sans-serif", "system-ui", "sans-serif"]
    },
    fontSize: {
      xs: ["13px", "16px"],
      sm: ["14px", "18px"],
      md: ["16px", "20px"],
      lg: ["18px", "23px"],
      xl: ["20px", "25px"],
      "2xl": ["24px", "30px"],
      "3xl": ["32px", "40px"],
      "4xl": ["36px", "45px"],
      "5xl": ["48px", "60px"]
    }
  },
  plugins: [require("@tailwindcss/typography")]
}
