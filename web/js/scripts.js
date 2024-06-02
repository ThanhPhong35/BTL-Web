

//Slider
let slider = document.querySelector('.slider .list');
let items = document.querySelectorAll('.slider .list .item');
let next = document.getElementById('next');
let prev = document.getElementById('prev');
let dots = document.querySelectorAll('.slider .dots li');

let lengthItems = items.length - 1;
let active = 0;
next.onclick = function(){
    active = active + 1 <= lengthItems ? active + 1 : 0;
    reloadSlider();
}
prev.onclick = function(){
    active = active - 1 >= 0 ? active - 1 : lengthItems;
    reloadSlider();
}
let refreshInterval = setInterval(()=> {next.click()}, 3000);
function reloadSlider(){
    slider.style.left = -items[active].offsetLeft + 'px';
    // 
    let last_active_dot = document.querySelector('.slider .dots li.active');
    last_active_dot.classList.remove('active');
    dots[active].classList.add('active');

    clearInterval(refreshInterval);
    refreshInterval = setInterval(()=> {next.click()}, 3000);  
}
dots.forEach((li, key) => {
    li.addEventListener('click', ()=>{
         active = key;
         reloadSlider();
    })
})
window.onresize = function(event) {
reloadSlider();
};


// Login

function checkLogin() {
//    document.getElementById('loginForm').reset();
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
    var usernameError = document.getElementById('usernameError');
    var passwordError = document.getElementById('passwordError');
    // Reset error messages
    usernameError.textContent = '';
    passwordError.textContent = '';
    if (username.trim() === '') {
        usernameError.textContent = 'Vui lòng nhập Tên đăng nhập';
        event.preventDefault(); // Prevent form submission
    }
    if (password.trim() === '') {
        passwordError.textContent = 'Vui lòng nhập Mật khẩu';
        event.preventDefault(); // Prevent form submission
    }
}



// Sign up
function checkSign() {
    var username = document.getElementById('username').value;
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('confirm-password').value;
    
    var usernameError = document.getElementById('usernameError');
    var emailError = document.getElementById('emailError');
    var passwordError = document.getElementById('passwordError');
    var confirmError = document.getElementById('confirmError');
    // Reset error messages
    usernameError.textContent = '';
    emailError.textContent = '';
    passwordError.textContent = '';
    confirmError.textContent = '';
    if (username.trim() === '') {
        usernameError.textContent = 'Vui lòng nhập tên đăng nhập';
       event.preventDefault(); // Prevent form submission
    }
    if (email.trim() === '') {
        emailError.textContent = 'Vui lòng nhập email';
        event.preventDefault();
    }
    if (password.trim() === '') {
        passwordError.textContent = 'Vui lòng nhập nật khẩu';
        event.preventDefault();
    }
    if (confirmPassword.trim() === '') {
        confirmError.textContent = 'Vui lòng xác nhận mật khẩu';
        event.preventDefault();
    }
    else if(confirmPassword != password){
        confirmError.textContent = 'Mật khẩu không khớp';
        event.preventDefault();
    }
}


//Lấy và xử lý sự kiện khi liên kết trong menu được nhấp:
let sideMenu = document.querySelectorAll(".nav-link");
sideMenu.forEach((item) => {
  let li = item.parentElement;

  item.addEventListener("click", () => {
    sideMenu.forEach((link) => {
      link.parentElement.classList.remove("active");
    });
    li.classList.add("active");
  });
});

//Ẩn/Hiện menu bên khi nút menu được nhấp:
let menuBar = document.querySelector(".menu-btn");
let sideBar = document.querySelector(".sidebar");
menuBar.addEventListener("click", () => {
  sideBar.classList.toggle("hide");
});

let switchMode = document.getElementById("switch-mode");
switchMode.addEventListener("change", (e) => {
  if (e.target.checked) {
    document.body.classList.add("dark");
  } else {
    document.body.classList.remove("dark");
  }
});

let searchFrom = document.querySelector(".content nav form");
let searchBtn = document.querySelector(".search-btn");
let searchIcon = document.querySelector(".search-icon");
searchBtn.addEventListener("click", (e) => {
  if (window.innerWidth < 576) {
    e.preventDefault();
    searchFrom.classList.toggle("show");
    if (searchFrom.classList.contains("show")) {
      searchIcon.classList.replace("fa-search", "fa-times");
    } else {
      searchIcon.classList.replace("fa-times", "fa-search");
    }
  }
});


// Quantity

 function increment() {
              var quantityInput = document.getElementById('quantity');
              var quantityValue = parseInt(quantityInput.value, 10);
              quantityInput.value = quantityValue + 1;
              validateQuantity();
            }

            function decrement() {
              var quantityInput = document.getElementById('quantity');
              var quantityValue = parseInt(quantityInput.value, 10);

              if (quantityValue > 1) {
                quantityInput.value = quantityValue - 1;
              }

              validateQuantity();
            }

            function validateQuantity() {
              var quantityInput = document.getElementById('quantity');
              var quantityValue = parseInt(quantityInput.value, 10);

              if (isNaN(quantityValue) || quantityValue < 1) {
                quantityInput.value = 1;
              }
            }


// Hiển thị password
// Hiển thị password
function togglePassword() {
  var passwordInput = document.getElementById("password");
  var confirmpasswordInput = document.getElementById("confirm-password");
  var showPasswordCheckbox = document.getElementById("showPassword");

  // Kiểm tra trạng thái của checkbox
  if (showPasswordCheckbox.checked) {
    // Nếu được kiểm tra, hiển thị mật khẩu
    passwordInput.type = "text";
    confirmpasswordInput.type = "text";
  } else {
    // Ngược lại, ẩn mật khẩu
    passwordInput.type = "password";
    confirmpasswordInput.type = "password";
  }
}

// Kiểm tra xác nhận

function checkConfirmPass() {
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('confirm-password').value;

    var confirmError = document.getElementById('confirmError');

    confirmError.textContent = '';
    if (confirmPassword != password) {
        confirmError.textContent = 'Mật khẩu xác nhận không khớp';
        confirmError.style.display = 'block'; // Hiển thị thông báo lỗi
        event.preventDefault();
    } else {
        confirmError.style.display = 'none'; // Ẩn thông báo lỗi nếu mật khẩu khớp
    }
}

function confirmExitAccount() {
      var isConfirmed = confirm("Bạn có chắc chắn muốn thoát không?");
      if (isConfirmed) {
         window.location.href = 'home';
      }
   }
   
