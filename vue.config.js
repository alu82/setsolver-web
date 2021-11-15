module.exports = {
    configureWebpack: {
      devServer: {
        proxy : process.env.SETSOLVER_API_URL
      }
    }
  };