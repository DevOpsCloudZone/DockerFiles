const http = require("http");

const PORT = 3000;

const server = http.createServer((req, res) => {
    res.writeHead(200, { "Content-Type": "text/html" });

    res.end(`
        <html>
            <head>
                <title>Node.js App</title>
            </head>
            <body>
                <h1>Welcome to Node.js 🚀</h1>
                <p>Node.js application is running successfully.</p>
            </body>
        </html>
    `);
});

server.listen(PORT, "0.0.0.0", () => {
    console.log(`Server running on port ${PORT}`);
});
