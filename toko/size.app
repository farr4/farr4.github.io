<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Size Recommendation</title>
<style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #cdcdcd;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: linear-gradient(145deg, #ffffff, #e7e8ea);
            box-shadow: 4px 4px 12px rgba(0, 0, 0, 0.1), -4px -4px 12px rgba(255, 255, 255, 0.7);
            border-radius: 20px;
            padding: 30px;
            max-width: 450px;
            width: 100%;
            transition: transform 0.3s ease-in-out;
            animation: slideIn 0.6s ease-out;
        }
        @keyframes slideIn {
            0% {
                transform: translateY(50px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }
        .container:hover {
        transform: translateY(-5px);
        }
        h2 {
            text-align: center;
            color: #5d6369;
            font-weight: 700;
            font-size: 2rem;
            margin-bottom: 10px;
            letter-spacing: 1px;
        }
        h3 {
            margin-top: 25px;
            color: #555;
            font-weight: 600;
            font-size: 1.3rem;
            margin-bottom: 10px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: #666;
            font-weight: 500;
        }
        input {
            width: 100%;
            padding: 15px;
            border: 2px solid #98a2a8;
            border-radius: 10px;
            margin-bottom: 20px;
            box-sizing: border-box;
            font-size: 15px;
            background-color: #f9fbfd;
            box-shadow: inset 2px 2px 6px rgba(0, 0, 0, 0.1), inset -2px -2px 6px rgba(255, 255, 255, 0.7);
            transition: all 0.3s ease;
        }
        input:focus {
            border-color: #686e7c;
            outline: none;
            box-shadow: 0 0 10px rgba(94, 96, 99, 0.5);
        }
        button {
            width: 100%;
            padding: 16px;
            background-color: #5d6369;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 17px;
            cursor: pointer;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2), -2px -2px 10px rgba(255, 255, 255, 0.5);
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        button:hover {
            background-color: #3f444a;
            transform: scale(1.05);        
        }
        button:active {
        transform: scale(0.98);
        }
        .result {
            margin-top: 25px;
            font-weight: bold;
            text-align: center;
            color: #333;
            font-size: 1.1rem;
            background-color: #c9def0;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .section {
            display: none;
            animation: fadeIn 0.5s ease-out;
        }
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
        .radio-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 16px;
        }
        .radio-group label {
            font-size: 14px;
            color: #555;
            cursor: pointer;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .radio-group input {
            margin-right: 8px;
        }

        .radio-group input:checked + label {
        color: #59636e;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            button {
                font-size: 14px;
                padding: 14px;
            }

            input {
                font-size: 13px;
            }
        }
    </style>

   
</head>
<body>
    <div class="container">
        <h2>Size Recommendation</h2>

        <h3>Gender</h3>
        <div class="radio-group">
            <label>
                <input type="radio" name="gender" value="male" onclick="toggleSections()" checked> Male
            </label>
            <label>
                <input type="radio" name="gender" value="female" onclick="toggleSections()"> Female
            </label>
        </div>

        <div id="male-section" class="section">
            <h3>Top Size (Male)</h3>
            <label for="shoulder">Shoulder Width (cm):</label>
            <input type="number" id="shoulder" placeholder="Enter your shoulder width">

            <h3>Bottom Size (Male)</h3>
            <label for="waist">Waist Circumference (cm):</label>
            <input type="number" id="waist" placeholder="Enter your waist circumference">

            <label for="heightBottom">Height (cm):</label>
            <input type="number" id="heightBottom" placeholder="Enter your height">
        </div>

        <div id="female-section" class="section">
            <h3>Top Size (Female)</h3>
            <label for="chest">Chest Circumference (cm):</label>
            <input type="number" id="chest" placeholder="Enter your chest circumference">

            <h3>Bottom Size (Female)</h3>
            <label for="waistFemale">Waist Circumference (cm):</label>
            <input type="number" id="waistFemale" placeholder="Enter your waist circumference">

            <label for="hip">Hip Circumference (cm):</label>
            <input type="number" id="hip" placeholder="Enter your hip circumference">

            <label for="heightBottomFemale">Height (cm):</label>
            <input type="number" id="heightBottomFemale" placeholder="Enter your height">
        </div>

        <button onclick="recommendSize()">Get Recommendation</button>

        <div class="result" id="result"></div>
    </div>

    <script>
        function toggleSections() {
            const gender = document.querySelector('input[name="gender"]:checked').value;
            document.getElementById('male-section').style.display = gender === 'male' ? 'block' : 'none';
            document.getElementById('female-section').style.display = gender === 'female' ? 'block' : 'none';
        }

        // Initialize sections visibility
        toggleSections();

        function recommendSize() {
            const gender = document.querySelector('input[name="gender"]:checked').value;
            const result = document.getElementById('result');
            let topSize, bottomSize;

            if (gender === 'male') {
                const shoulder = parseFloat(document.getElementById('shoulder').value);
                const waist = parseFloat(document.getElementById('waist').value);
                const heightBottom = parseFloat(document.getElementById('heightBottom').value);

                if (
                    isNaN(shoulder) || shoulder <= 0 ||
                    isNaN(waist) || isNaN(heightBottom) || waist <= 0 || heightBottom <= 0
                ) {
                    result.textContent = 'Please enter valid measurements for male.';
                    return;
                }

                // Male top size logic
                if (shoulder < 45) {
                    topSize = 'S';
                } else if (shoulder <= 60) {
                    topSize = 'M';
                } else if (shoulder <= 70) {
                    topSize = 'L';
                } else {
                    topSize = 'XL';
                }

                // Male bottom size logic
                if (waist < 65 && heightBottom < 160) {
                    bottomSize = 'S';
                } else if (waist <= 80 && heightBottom <= 170) {
                    bottomSize = 'M';
                } else if (waist <= 90 && heightBottom <= 180) {
                    bottomSize = 'L';
                } else {
                    bottomSize = 'XL';
                }
            } else {
                const chest = parseFloat(document.getElementById('chest').value);
                const waistFemale = parseFloat(document.getElementById('waistFemale').value);
                const hip = parseFloat(document.getElementById('hip').value);
                const heightBottomFemale = parseFloat(document.getElementById('heightBottomFemale').value);

                if (
                    isNaN(chest) || chest <= 0 ||
                    isNaN(waistFemale) || isNaN(hip) || isNaN(heightBottomFemale) || waistFemale <= 0 || hip <= 0 || heightBottomFemale <= 0
                ) {
                    result.textContent = 'Please enter valid measurements for female.';
                    return;
                }

                // Female top size logic
                if (chest < 60 && heightBottomFemale < 150) {
                    topSize = 'S';
                } else if (chest <= 70 && heightBottomFemale <= 160) {
                    topSize = 'M';
                } else if (chest <= 80 && heightBottomFemale <= 170) {
                    topSize = 'L';
                } else {
                    topSize = 'XL';
                }   

                // Female bottom size logic
                if (waistFemale < 60 && hip < 60 && heightBottomFemale < 150) {
                    bottomSize = 'S';
                } else if (waistFemale <= 70 && hip <= 70 && heightBottomFemale <= 160) {
                    bottomSize = 'M';
                } else if (waistFemale <= 80 && hip <= 80 && heightBottomFemale <= 170) {
                    bottomSize = 'L';
                } else {
                    bottomSize = 'XL';
                }
            }

            result.textContent = `Recommended sizes:\nTop: ${topSize}\nBottom: ${bottomSize}`;
        }
    </script>
</body>
</html>
