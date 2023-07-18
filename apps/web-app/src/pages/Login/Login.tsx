import React, { useRef, useEffect, useState } from 'react';
import Typography from '@mui/material/Typography';
import './index.scss';
import Meta from '@/components/Meta';
import { FullSizeCenteredFlexBox } from '@/components/styled';
import PersonIcon from '@mui/icons-material/Person';
import LockIcon from '@mui/icons-material/Lock';
import EmailIcon from '@mui/icons-material/Email';

function Login() {
  const [form, setForm] = useState<'login' | 'register'>('login');
  const wrapper = useRef<HTMLDivElement>(null);

  function loginLinkClick(e: React.MouseEvent) {
    e.preventDefault();
    if (null !== wrapper.current) {
      wrapper.current.classList.remove('active');
      setForm('register');
    }
  }

  function registerLinkClick(e: React.MouseEvent) {
    e.preventDefault();
    if (null !== wrapper.current) {
      wrapper.current.classList.add('active');
      setForm('login');
    }
  }
  return (
    <>
      <Meta title="Login or Register" />
      <FullSizeCenteredFlexBox>
        <div className="wrapper" ref={wrapper}>
          <span className="bg-animate"></span>
          <span className="bg-animate2"></span>
          <div className="form-box login">
            <Typography
              variant="h2"
              fontWeight={600}
              className="animation"
              style={{ '--i': 0, '--j': 21 } as React.CSSProperties}
            >
              Login
            </Typography>
            <form action="#">
              <div
                className="input-box animation"
                style={{ '--i': 1, '--j': 22 } as React.CSSProperties}
              >
                <input type="text" id="username" required />
                <label htmlFor="username">Username</label>
                <PersonIcon />
              </div>
              <div
                className="input-box animation"
                style={{ '--i': 2, '--j': 23 } as React.CSSProperties}
              >
                <input type="password" id="password" required />
                <label htmlFor="password">Password</label>
                <LockIcon />
              </div>
              <button
                type="submit"
                className="btn animation"
                style={{ '--i': 3, '--j': 24 } as React.CSSProperties}
              >
                Login
              </button>
              <div
                className="logreg-link animation"
                style={{ '--i': 4, '--j': 24 } as React.CSSProperties}
              >
                <p>
                  Don't have an account?{' '}
                  <a href="#" className="register-link" onClick={registerLinkClick}>
                    Sign up
                  </a>
                </p>
              </div>
            </form>
          </div>
          <div className="info-text login">
            <Typography
              variant="h2"
              fontWeight={600}
              textTransform={`uppercase`}
              className="animation"
              style={{ '--i': 0, '--j': 20 } as React.CSSProperties}
            >
              Welcome Back!
            </Typography>
            <Typography
              className="animation"
              style={{ '--i': 1, '--j': 21 } as React.CSSProperties}
            >
              Lorem ipsum dolor sit amet consectetur adipisicing.
            </Typography>
          </div>
          <div className="form-box register">
            <Typography
              variant="h2"
              fontWeight={600}
              className="animation"
              style={{ '--i': 17, '--j': 0 } as React.CSSProperties}
            >
              Sign Up
            </Typography>
            <form action="#">
              <div
                className="input-box animation"
                style={{ '--i': 18, '--j': 1 } as React.CSSProperties}
              >
                <input type="text" id="username" required />
                <label htmlFor="username">Username</label>
                <PersonIcon />
              </div>
              <div
                className="input-box animation"
                style={{ '--i': 19, '--j': 2 } as React.CSSProperties}
              >
                <input type="text" id="email" required />
                <label htmlFor="email">Email</label>
                <EmailIcon />
              </div>
              <div
                className="input-box animation"
                style={{ '--i': 20, '--j': 3 } as React.CSSProperties}
              >
                <input type="password" id="password" required />
                <label htmlFor="password">Password</label>
                <LockIcon />
              </div>
              <button
                type="submit"
                className="btn animation"
                style={{ '--i': 21, '--j': 4 } as React.CSSProperties}
              >
                Sign Up
              </button>
              <div
                className="logreg-link animation"
                style={{ '--i': 22, '--j': 5 } as React.CSSProperties}
              >
                <p>
                  Already have an account?{' '}
                  <a href="#" className="login-link" onClick={loginLinkClick}>
                    Login
                  </a>
                </p>
              </div>
            </form>
          </div>
          <div className="info-text register">
            <Typography
              variant="h2"
              fontWeight={600}
              textTransform={`uppercase`}
              className="animation"
              style={{ '--i': 17, '--j': 0 } as React.CSSProperties}
            >
              Sign Up Today!
            </Typography>
            <Typography
              className="animation"
              style={{ '--i': 18, '--j': 1 } as React.CSSProperties}
            >
              Lorem ipsum dolor sit amet consectetur adipisicing.
            </Typography>
          </div>
        </div>
      </FullSizeCenteredFlexBox>
    </>
  );
}

export default Login;
