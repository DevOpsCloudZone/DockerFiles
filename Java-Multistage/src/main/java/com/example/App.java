package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class App {

    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }

    @GetMapping("/")
    public String home() {
        return """
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <title>Java Spring Boot App</title>

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
                        font-size: 45px;
                        font-weight: bold;
                        letter-spacing: 3px;
                        margin-bottom: 10px;
                    }

                    h1 {
                        color: #222;
                        font-size: 34px;
                        margin: 15px 0 10px;
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

                    <div class="icon">JAVA</div>

                    <h1>Java Spring Boot Application</h1>

                    <p class="subtitle">
                        Welcome to my Containerized Java application
                    </p>

                    <div class="info">

                        <div class="box">
                            <strong>Runtime</strong>
                            <span>Java 17</span>
                        </div>

                        <div class="box">
                            <strong>Framework</strong>
                            <span>Spring Boot</span>
                        </div>

                        <div class="box">
                            <strong>Port</strong>
                            <span>8080</span>
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
            """;
    }
}
