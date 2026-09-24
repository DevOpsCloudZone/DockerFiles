const http = require("http");

const PORT = 3000;

const server = http.createServer((req, res) => {
    res.writeHead(200, { "Content-Type": "text/html" });

    res.end(`
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Node.js Docker App</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #e8ecf1);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            width: 90%;
            max-width: 650px;
            background: white;
            padding: 45px;
            text-align: center;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
        }

        .icon {
            font-size: 55px;
            margin-bottom: 10px;
        }

        h1 {
            margin: 10px 0;
            color: #222;
            font-size: 34px;
        }

        .subtitle {
            color: #666;
            font-size: 18px;
            margin-bottom: 30px;
        }

        .info {
            display: flex;
            justify-content: space-around;
            gap: 15px;
            margin-top: 25px;
        }

        .box {
            flex: 1;
            padding: 18px;
            background: #f7f8fa;
            border-radius: 10px;
        }

        .box strong {
            display: block;
            color: #333;
            margin-bottom: 6px;
        }

        .box span {
            color: #666;
            font-size: 14px;
        }

        .status {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 22px;
            border-radius: 25px;
            background: #e8f5e9;
            color: #2e7d32;
            font-weight: bold;
        }

        footer {
            margin-top: 25px;
            color: #999;
            font-size: 13px;
        }
    </style>
</head>

<body>

    <div class="card">

        <div class="icon">🚀</div>

        <h1>Node.js Application</h1>

        <p class="subtitle">
            Welcome to my Containerized Node.js Application
        </p>

        <div class="info">

            <div class="box">
                <strong>Runtime</strong>
                <span>Node.js</span>
            </div>

            <div class="box">
                <strong>Server</strong>
                <span>HTTP</span>
            </div>

            <div class="box">
                <strong>Port</strong>
                <span>3000</span>
            </div>

        </div>

        <div class="status">
            ✓ Application Running
        </div>

        <footer>
            Deployed using Containers
        </footer>

    </div>

</body>
</html>
    `);
});

server.listen(PORT, "0.0.0.0", () => {
    console.log(`Node.js server running on port ${PORT}`);
});
