FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
FROM node:18
WORKDIR /app
COPY --from=build /app/dist /app/dist
RUN npm install express@4.18.2
COPY <<EOF /app/server.js
const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;
app.use(express.static(path.join(__dirname, 'dist')));
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist', 'index.html'));
});
app.get('/books', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist', 'index.html'));
});
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist', 'index.html'));
});
app.listen(PORT, () => {
  console.log(\`Server is running on port \${PORT}\`);
});
EOF
EXPOSE 3000
CMD ["node", "server.js"]