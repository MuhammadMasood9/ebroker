<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="csrf-token" content="{{ csrf_token() }}">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="{{ url('assets/images/logo/' . (system_setting('favicon_icon') ?? null)) }}" type="image/x-icon">
    <title>{{ __('Login') }}</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ url('assets/css/main/app.css') }}">
    <link rel="stylesheet" href=" {{ url('assets/css/pages/auth.css') }}">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <div id="auth" class="login_bg">

        <div class="row justify-content-end login-box">
            <div class="col-lg-4 col-12 card">
                <div id="auth-center">

                    <div class="auth-logo mb-5">
                        <a href="{{ url('') }}"><img src="{{ url('assets/images/logo/' . (system_setting('company_logo') ?? null)) }}" alt="Logo" srcset=""></a>
                    </div>
                    <div class="center mtop-120">
                        <div class='login_heading'>
                            <h3>
                                {{ __('Hi, Welcome Back!') }}
                            </h3>
                            <p>
                                {{ __('Enter your details sign in to your account') }}
                            </p>
                        </div>

                        <div class="pt-4">
                            <form method="POST" action="{{ route('login') }}">
                                {{-- {{ csrf_field() }} --}}
                                @csrf

                                <div class="form-group position-relative form-floating mb-4"> <input id="floatingInput" type="email" placeholder="{{ __('Email') }}" class="form-control form-input @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                                    <label for="floatingInput">{{ __('Email address') }}</label>
                                </div>

                                <div class="form-group position-relative form-floating has-icon-right mb-4" id="pwd">
                                    <input id="floatingInput" type="password" placeholder="{{ __('Password') }}" class="form-control form-input @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">
                                    <label for="floatingInput">{{ __('Password') }}</label>
                                    @error('password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror

                                    <div class="form-control-icon icon-right">
                                        <i class="bi bi-eye" id='toggle_pass'></i>
                                    </div>
                                </div>
                                <button class="btn btn-primary btn-block btn-sm shadow-lg mt-3 login_btn">{{ __('Log in') }}</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <script>
        // Set the CSS custom property using JavaScript
        var primarycolor = "{{ env('PRIMARY_COLOR') }}";

        document.documentElement.style.setProperty('--bs-primary', primarycolor);

        var rgbaprimarycolor = "{{ env('PRIMARY_RGBA_COLOR') }}";

        document.documentElement.style.setProperty('--primary-rgba', rgbaprimarycolor);
    </script>
    <script>
        $('#pwd').click(function() {
            console.log('click');
            $('#password').focus();
        });
        $("#toggle_pass").click(function() {

            $(this).toggleClass("bi bi-eye bi-eye-slash");
            var input = $('[name="password"]');
            if (input.attr("type") == "password") {
                input.attr("type", "text");

            } else {
                input.attr("type", "password");
            }
        });
    </script>
</body>

</html>
