

function openAdd() {
    document.getElementById('overlay').style.display = 'block';
    document.getElementById('add-new').style.display = 'block';
}

function closeAdd() {
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('add-new').style.display = 'none';
}

function closeView() {
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('view').style.display = 'none';
}

//Xác nhận xóa
function confirmDeleteCategory(e, cId) {
      e.preventDefault();
      var isConfirmed = confirm("Bạn có chắc chắn muốn xóa không?");
      if (isConfirmed) {
        window.location.href = 'delete-category?cid=' + cId;
      }
   }
function confirmDeleteAccount(e, userId) {
      e.preventDefault();
      var isConfirmed = confirm("Bạn có chắc chắn muốn xóa không?");
      if (isConfirmed) {
         window.location.href = 'delete-account?id=' + userId;
      }
   }
   
function confirmDeleteProduct(e, id) {
      e.preventDefault();
      var isConfirmed = confirm("Bạn có chắc chắn muốn xóa không?");
      if (isConfirmed) {
         window.location.href = 'delete-product?id=' + id;
      }
   }

//Xác nhận thoát form Add
function confirmExitAccount() {
      var isConfirmed = confirm("Bạn có chắc chắn muốn thoát không?");
      if (isConfirmed) {
         window.location.href = 'account-managerment';
      }
   }

function confirmExitCate() {
      var isConfirmed = confirm("Bạn có chắc chắn muốn thoát không?");
      if (isConfirmed) {
         window.location.href = 'category-managerment';
      }
   }
   
function confirmExitProduct() {
      var isConfirmed = confirm("Bạn có chắc chắn muốn thoát không?");
      if (isConfirmed) {
         window.location.href = 'product-managerment';
      }
   }

// Mở or khóa tài khoản
function activateAccount(e,id) {
    e.preventDefault();
    var isConfirmed = confirm("Bạn có chắc chắn mở khóa tài khoản này?");
    if (isConfirmed) {
       window.location.href = 'activate-account?id=' + id;
        }
    }
   
function inactivateAccount(e,id) {
    e.preventDefault();
    var isConfirmed = confirm("Bạn có chắc chắn khóa tài khoản này?");
    if (isConfirmed) {
       window.location.href = 'inactivate-account?id=' + id;
        }
    }
    
// Xác nhận or Hủy đơn hàng
function confirmOrder(e,id) {
    e.preventDefault();
    var isConfirmed = confirm("Bạn có chắc chắn xác nhận đơn hàng này?");
    if (isConfirmed) {
       window.location.href = 'confirm-order?id=' + id;
        }
    }

function canceldOrder(e,id) {
    e.preventDefault();
    var isConfirmed = confirm("Bạn có chắc chắn hủy đơn hàng này?");
    if (isConfirmed) {
       window.location.href = 'cancel-order?id=' + id;
        }
    }
    
// Hiển thị password
function togglePassword() {
  var passwordInput = document.getElementById("password");
  var showPasswordCheckbox = document.getElementById("showPassword");

  // Kiểm tra trạng thái của checkbox
  if (showPasswordCheckbox.checked) {
    // Nếu được kiểm tra, hiển thị mật khẩu
    passwordInput.type = "text";
  } else {
    // Ngược lại, ẩn mật khẩu
    passwordInput.type = "password";
  }
}


