<?php 
$details = explode('+', phpversion()); 
?> 
<html>
<head>
    <title>Docker PHP</title>
    <style>
	* {
	    box-sizing: border-box;
    }
    body {
        font-family: helvetica, sans-serif;
        color: #333;
        margin: 0;
        padding: 0;
	}
	.details {
            position: absolute;
	    text-align: center;
	    top: 50%;
            width: 100%;
            margin-top: -10px;
	    font-size: 20px;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="details">
        Using PHP <?php echo $details[0]; ?>
    </div>
</body>
</html>
