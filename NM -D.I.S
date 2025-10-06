<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Sign Up</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            color: #fff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 400px;
            background: rgba(22, 22, 36, 0.8);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(10px);
            padding: 40px 30px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        h1 {
            font-size: 2.5rem;
            background: linear-gradient(45deg, #ff6b6b, #ffa585);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 10px;
            text-shadow: 0 2px 10px rgba(255, 107, 107, 0.3);
        }

        .subtitle {
            color: #d8d8d8;
            font-size: 1rem;
        }

        .form-toggle {
            display: flex;
            margin-bottom: 25px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 30px;
            overflow: hidden;
        }

        .toggle-btn {
            flex: 1;
            background: none;
            border: none;
            color: #d8d8d8;
            padding: 12px 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1rem;
        }

        .toggle-btn.active {
            background: rgba(255, 107, 107, 0.8);
            color: white;
        }

        .form-container {
            display: none;
        }

        .form-container.active {
            display: block;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #d8d8d8;
            font-size: 0.95rem;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            color: white;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #ff6b6b;
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 0 10px rgba(255, 107, 107, 0.3);
        }

        input::placeholder {
            color: #a8a8a8;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(45deg, #ff6b6b, #ffa585);
            border: none;
            color: white;
            border-radius: 10px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
        }

        .error {
            color: #ff6b6b;
            font-size: 0.9rem;
            margin-top: 5px;
            display: none;
        }

        .success {
            color: #4caf50;
            font-size: 0.9rem;
            margin-top: 5px;
            display: none;
        }

        @media (max-width: 480px) {
            .container {
                padding: 30px 20px;
                margin: 10px;
            }

            h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Welcome</h1>
            <p class="subtitle">Please log in or sign up to continue</p>
        </div>

        <div class="form-toggle">
            <button class="toggle-btn active" id="login-toggle">Login</button>
            <button class="toggle-btn" id="signup-toggle">Sign Up</button>
        </div>

        <!-- Login Form -->
        <div class="form-container active" id="login-form">
            <form id="loginForm">
                <div class="form-group">
                    <label for="login-username">Username</label>
                    <input type="text" id="login-username" placeholder="Enter your username" required>
                </div>
                <div class="form-group">
                    <label for="login-password">Password</label>
                    <input type="password" id="login-password" placeholder="Enter your password" required>
                </div>
                <div class="error" id="login-error"></div>
                <button type="submit" class="submit-btn">Log In</button>
            </form>
        </div>

        <!-- Sign Up Form -->
        <div class="form-container" id="signup-form">
            <form id="signupForm">
                <div class="form-group">
                    <label for="signup-username">Username</label>
                    <input type="text" id="signup-username" placeholder="Choose a username" required>
                </div>
                <div class="form-group">
                    <label for="signup-email">Email</label>
                    <input type="email" id="signup-email" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label for="signup-password">Password</label>
                    <input type="password" id="signup-password" placeholder="Create a password" required>
                </div>
                <div class="error" id="signup-error"></div>
                <div class="success" id="signup-success"></div>
                <button type="submit" class="submit-btn">Sign Up</button>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const loginToggle = document.getElementById('login-toggle');
            const signupToggle = document.getElementById('signup-toggle');
            const loginFormContainer = document.getElementById('login-form');
            const signupFormContainer = document.getElementById('signup-form');
            const loginForm = document.getElementById('loginForm');
            const signupForm = document.getElementById('signupForm');

            // Toggle between forms
            loginToggle.addEventListener('click', function() {
                loginToggle.classList.add('active');
                signupToggle.classList.remove('active');
                loginFormContainer.classList.add('active');
                signupFormContainer.classList.remove('active');
                clearErrors();
            });

            signupToggle.addEventListener('click', function() {
                signupToggle.classList.add('active');
                loginToggle.classList.remove('active');
                signupFormContainer.classList.add('active');
                loginFormContainer.classList.remove('active');
                clearErrors();
            });

            // Simulate user storage (in real app, use backend/database)
            function getUsers() {
                return JSON.parse(localStorage.getItem('users')) || [];
            }

            function saveUsers(users) {
                localStorage.setItem('users', JSON.stringify(users));
            }

            // Clear error messages
            function clearErrors() {
                document.querySelectorAll('.error, .success').forEach(el => el.style.display = 'none');
            }

            // Sign Up Handler
            signupForm.addEventListener('submit', function(e) {
                e.preventDefault();
                clearErrors();

                const username = document.getElementById('signup-username').value.trim();
                const email = document.getElementById('signup-email').value.trim();
                const password = document.getElementById('signup-password').value;

                if (!username || !email || !password) {
                    document.getElementById('signup-error').textContent = 'All fields are required.';
                    document.getElementById('signup-error').style.display = 'block';
                    return;
                }

                const users = getUsers();
                if (users.find(user => user.username === username || user.email === email)) {
                    document.getElementById('signup-error').textContent = 'Username or email already exists.';
                    document.getElementById('signup-error').style.display = 'block';
                    return;
                }

                // Save new user (password stored in plain text for demo; never do this in production!)
                users.push({ username, email, password });
                saveUsers(users);

                document.getElementById('signup-success').textContent = 'Sign up successful! Redirecting...';
                document.getElementById('signup-success').style.display = 'block';

                // Simulate delay and redirect to second page (save as slider.html)
                setTimeout(() => {
                    localStorage.setItem('isLoggedIn', 'true');
                    localStorage.setItem('currentUser', username);
                    window.location.href = 'slider.html'; // Replace with your second page filename
                }, 1500);
            });

            // Login Handler
            loginForm.addEventListener('submit', function(e) {
                e.preventDefault();
                clearErrors();

                const username = document.getElementById('login-username').value.trim();
                const password = document.getElementById('login-password').value;

                if (!username || !password) {
                    document.getElementById('login-error').textContent = 'Username and password are required.';
                    document.getElementById('login-error').style.display = 'block';
                    return;
                }

                const users = getUsers();
                const user = users.find(u => u.username === username && u.password === password);

                if (!user) {
                    document.getElementById('login-error').textContent = 'Invalid username or password.';
                    document.getElementById('login-error').style.display = 'block';
                    return;
                }

                // On success, redirect to second page
                localStorage.setItem('isLoggedIn', 'true');
                localStorage.setItem('currentUser', username);
                window.location.href = 'slider.html'; // Replace with your second page filename
            });

            // Optional: Check if already logged in and redirect
            if (localStorage.getItem('isLoggedIn') === 'true') {
                window.location.href = 'slider.html';
            }
        });
    </script>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cool Image Gallery</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            color: #fff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 960px;
            background: rgba(22, 22, 36, 0.8);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(10px);
            padding: 30px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        h1 {
            font-size: 2.8rem;
            background: linear-gradient(45deg, #ff6b6b, #ffa585);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 10px;
            text-shadow: 0 2px 10px rgba(255, 107, 107, 0.3);
        }

        .subtitle {
            color: #d8d8d8;
            font-size: 1.2rem;
        }

        .slider-container {
            position: relative;
            width: 100%;
            overflow: hidden;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
            margin-bottom: 25px;
        }

        .slider {
            display: flex;
            transition: transform 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            height: 450px;
        }

        .slide {
            min-width: 100%;
            position: relative;
        }

        .slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        .slide-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(to top, rgba(0, 0, 0, 0.9), transparent);
            padding: 25px 20px 15px;
            color: white;
        }

        .slide-title {
            font-size: 1.6rem;
            margin-bottom: 8px;
            font-weight: 600;
        }

        .slide-description {
            font-size: 1rem;
            color: #e0e0e0;
        }

        .navigation {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .nav-btn {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            color: white;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            font-size: 1.2rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .nav-btn:hover {
            background: rgba(255, 107, 107, 0.8);
            transform: scale(1.1);
        }

        .dots {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-bottom: 20px;
        }

        .dot {
            width: 14px;
            height: 14px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.3);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .dot.active {
            background: #ff6b6b;
            transform: scale(1.2);
            box-shadow: 0 0 10px rgba(255, 107, 107, 0.6);
        }

        .dot:hover {
            background: rgba(255, 107, 107, 0.6);
        }

        .auto-play {
            text-align: center;
            margin-top: 10px;
        }

        .auto-toggle {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 30px;
            cursor: pointer;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .auto-toggle:hover {
            background: rgba(255, 107, 107, 0.8);
        }

        .auto-toggle.running {
            background: rgba(76, 175, 80, 0.8);
        }

        .thumbnail-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .thumbnail {
            width: 70px;
            height: 50px;
            border-radius: 6px;
            overflow: hidden;
            cursor: pointer;
            opacity: 0.6;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }

        .thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .thumbnail.active, .thumbnail:hover {
            opacity: 1;
            border-color: #ff6b6b;
            transform: scale(1.1);
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 2.2rem;
            }
            
            .slider {
                height: 350px;
            }
            
            .slide-title {
                font-size: 1.3rem;
            }
            
            .nav-btn {
                width: 45px;
                height: 45px;
            }
        }

        @media (max-width: 480px) {
            h1 {
                font-size: 1.8rem;
            }
            
            .slider {
                height: 280px;
            }
            
            .slide-title {
                font-size: 1.1rem;
            }
            
            .nav-btn {
                width: 40px;
                height: 40px;
            }
            
            .thumbnail {
                width: 50px;
                height: 40px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Visual Journey</h1>
            <p class="subtitle">Explore your custom JPG images</p>
        </div>
        
        <div class="slider-container">
            <div class="slider" id="slider">
                <div class="slide">
                    <img src="image1.jpg" alt="Photo">
                    <div class="slide-overlay">
                        <h3 class="slide-title">Image 1</h3>
                        <p class="slide-description">Your custom description for the first image</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="image2.jpg" alt="Your second JPG image">
                    <div class="slide-overlay">
                        <h3 class="slide-title">Image 2</h3>
                        <p class="slide-description">Your custom description for the second image</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="image3.jpg" alt="Your third JPG image">
                    <div class="slide-overlay">
                        <h3 class="slide-title">Image 3</h3>
                        <p class="slide-description">Your custom description for the third image</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="image4.jpg" alt="Your fourth JPG image">
                    <div class="slide-overlay">
                        <h3 class="slide-title">Image 4</h3>
                        <p class="slide-description">Your custom description for the fourth image</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="image5.jpg" alt="Your fifth JPG image">
                    <div class="slide-overlay">
                        <h3 class="slide-title">Image 5</h3>
                        <p class="slide-description">Your custom description for the fifth image</p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="navigation">
            <button class="nav-btn" id="prev-btn"><i class="fas fa-chevron-left"></i></button>
            <button class="nav-btn" id="next-btn"><i class="fas fa-chevron-right"></i></button>
        </div>
        
        <div class="dots" id="dots-container">
            <!-- Dots will be generated by JavaScript -->
        </div>
        
        <div class="thumbnail-container" id="thumbnail-container">
            <!-- Thumbnails will be generated by JavaScript -->
        </div>
        
        <div class="auto-play">
            <button class="auto-toggle" id="auto-toggle"><i class="fas fa-play"></i> Auto Play</button>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const slider = document.getElementById('slider');
            const slides = document.querySelectorAll('.slide');
            const prevBtn = document.getElementById('prev-btn');
            const nextBtn = document.getElementById('next-btn');
            const dotsContainer = document.getElementById('dots-container');
            const thumbnailContainer = document.getElementById('thumbnail-container');
            const autoToggle = document.getElementById('auto-toggle');
            
            let currentSlide = 0;
            let isAutoPlaying = false;
            let autoPlayInterval;
            
            // Create dots for navigation
            slides.forEach((_, index) => {
                const dot = document.createElement('div');
                dot.classList.add('dot');
                if (index === 0) dot.classList.add('active');
                dot.addEventListener('click', () => goToSlide(index));
                dotsContainer.appendChild(dot);
            });
            
            // Create thumbnails
            slides.forEach((slide, index) => {
                const thumbnail = document.createElement('div');
                thumbnail.classList.add('thumbnail');
                if (index === 0) thumbnail.classList.add('active');
                
                const img = slide.querySelector('img').cloneNode(true);
                thumbnail.appendChild(img);
                
                thumbnail.addEventListener('click', () => goToSlide(index));
                thumbnailContainer.appendChild(thumbnail);
            });
            
            // Navigation functions
            function goToSlide(index) {
                currentSlide = index;
                slider.style.transform = `translateX(-${currentSlide * 100}%)`;
                
                // Update active dot
                document.querySelectorAll('.dot').forEach((dot, i) => {
                    dot.classList.toggle('active', i === currentSlide);
                });
                
                // Update active thumbnail
                document.querySelectorAll('.thumbnail').forEach((thumb, i) => {
                    thumb.classList.toggle('active', i === currentSlide);
                });
            }
            
            function nextSlide() {
                goToSlide((currentSlide + 1) % slides.length);
            }
            
            function prevSlide() {
                goToSlide((currentSlide - 1 + slides.length) % slides.length);
            }
            
            // Auto-play functionality
            function toggleAutoPlay() {
                isAutoPlaying = !isAutoPlaying;
                
                if (isAutoPlaying) {
                    autoPlayInterval = setInterval(nextSlide, 4000);
                    autoToggle.classList.add('running');
                    autoToggle.innerHTML = '<i class="fas fa-pause"></i> Pause';
                } else {
                    clearInterval(autoPlayInterval);
                    autoToggle.classList.remove('running');
                    autoToggle.innerHTML = '<i class="fas fa-play"></i> Auto Play';
                }
            }
            
            // Event listeners
            prevBtn.addEventListener('click', prevSlide);
            nextBtn.addEventListener('click', nextSlide);
            autoToggle.addEventListener('click', toggleAutoPlay);
            
            // Keyboard navigation
            document.addEventListener('keydown', (e) => {
                if (e.key === 'ArrowLeft') prevSlide();
                if (e.key === 'ArrowRight') nextSlide();
                if (e.key === ' ') {
                    e.preventDefault();
                    toggleAutoPlay();
                }
            });
            
            // Start auto-play initially
            toggleAutoPlay();
        });
    </script>
</body>
</html>
