
/*========== SHOW MENU =========*/
const navMenu = document.getElementById('nav-menu'),
    navToggle = document.getElementById('nav-toggle'),
    navClose  = document.getElementById('nav-close');

/*============ Menu show ============*/
navToggle.addEventListener('click',()=>{
    navMenu.classList.add('show-menu');
});

/**=========== Menu hidden =========== */
navClose.addEventListener('click',()=>{
    navMenu.classList.remove('show-menu');
});

/*============== LOGIN ==============*/
const login = document.getElementById ('login'),
    loginBtn = document.getElementById("login-btn"),
    loginClose = document.getElementById("login-close");

/*Show login*/
loginBtn.addEventListener('click',()=>{
    login.classList.add('show__login');
});

/*Close Login*/
loginClose.addEventListener('click',()=>{
    login.classList.remove('show__login');
});
const forwardSignIn = document.getElementById("forward_sigin"),
        form__Signin = document.getElementById("signin");
        forwardSignIn.addEventListener('click',()=>{
        login.classList.remove('show__login');
        form__Signin.classList.add("show__signin");
    })


// =========== Event sign in  =========  //
const forwardLogin  = document.getElementById("forward_login"),
    formLogin = document.getElementById("login"),
    formSignIn = document.getElementById('signin');
    forwardLogin.addEventListener('click',()=>{
        formSignIn.classList.remove("show__signin");
        formLogin.classList.add('show__login');
    });
    
// Close sign in  //
const btnCloseSignIn = document.getElementById('signin-close'),
    formSignin = document.getElementById('signin');
    btnCloseSignIn.addEventListener('click', ()=>{
        formSignin.classList.remove('show__signin');
    });


/*=========== SEARCH ===========*/
const search = document.getElementById("search"),
    searchBtn = document.getElementById('search-btn'),
    searchClose = document.getElementById('search-close');

/*Search show*/
searchBtn.addEventListener('click',()=>{
    search.classList.add('show-search');
});

/* Search close */
searchClose.addEventListener('click',()=>{
    search.classList.remove('show-search');
});



/*============= ToggleSubmenu ================*/ 
function toggleSubmenu (button){
	var list = document.getElementsByClassName('ct__submenu');
    button.nextElementSibling.classList.toggle("show");
}
	

	/*============= ToggleSubmenu ================*/ 
	function toggleSubmenu (button){
	    var list = document.getElementsByClassName('ct__submenu');
	    button.nextElementSibling.classList.toggle("show");
	};


/*	============= Event menu left ============== 
	var btnMenuLeft  = document.getElementById('btnMenuLeft'),
	    listMenuLeft = document.getElementById('categoryMenu');
	    btnMenuLeft.addEventListener('click',() =>{
	        if(listMenuLeft.style.opacity == 0){
	            listMenuLeft.style.opacity = 1;
	            listMenuLeft.classList.add('show__menuLeft');
	        }else{
	            listMenuLeft.style.opacity = 0;
	            listMenuLeft.classList.remove('show__menuLeft');
	        }
	    });*/

	    
	// Evennt OTP Sign in //
	const formOtp = document.getElementById('form-otp'),
	    btnCloseOtp = document.getElementById('otp-close'),
	    form_SignIn = document.getElementById('signin');
	    btnCloseOtp.addEventListener('click',() =>{
	        form_SignIn.classList.add('show__signin');
	        formOtp.classList.remove('show_form_otp');
	    })



	const inputs = document.querySelectorAll('.otp-card-inputs input');
	const button = document.querySelectorAll('.otp-card button');

	inputs.forEach(input => {
	    let lastInputStatus = 0;
	    input.onkeyup = (e) => {
	        const currentElement = e.target;
	        const nextElement = input.nextElementSibling;
	        const preElement = input.previousElementSibling;
	        //Kiểm tra người dùng nhấn phím backspace và input trước là vẫn còn (!=null)//
	        if (preElement && e.keyCode === 8) {
	            if (lastInputStatus === 1) {
	                preElement.value = '';
	                preElement.focus();
	            }
	            button[0].setAttribute('disabled', true);
	            lastInputStatus = 1
	        } else {
	            const reg = /^[0-9]+$/;
	            if (!reg.test(currentElement.value)) {
	                currentElement.value = currentElement.value.replace(/\D/g, '');
	            } else if (currentElement.value) {
	                if (nextElement) {
	                    nextElement.focus()
	                }else{
	                    button[0].removeAttribute('disabled')
	                    lastInputStatus = 0;
	                }
	            }
	        }
	    }
	});
    