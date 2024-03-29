import { useState, useRef } from 'react';
import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';
import './ProfileButton.css';
import toad from '../../../images/toad.jpg'

function ProfileButton() {
  const dispatch = useDispatch();
  const [showMenu, setShowMenu] = useState(false);
  const dropdownRef = useRef(null);
  
  const toggleMenu = (e) => {
    e.stopPropagation();
    setShowMenu(true);
  };
  
  // useEffect(() => {
  //   if (!showMenu) return;

  //   const closeMenu = (e) => {
  //     if (dropdownRef.current && !dropdownRef.current.contains(e.target)) {
  //       setShowMenu(false);
  //     }
  //   };

  //   // document.addEventListener('click', closeMenu);
  
  //   // return () => document.removeEventListener('click', closeMenu);
  // // }, [showMenu]);

  const logout = (e) => {
    e.preventDefault();
    dispatch(sessionActions.logout());
  };

  return (

    <>
      <div onMouseOver={toggleMenu} onMouseLeave={() => setShowMenu(false)} className='profile-button'> <img src={toad} id='profile-icon' />
        <i className="profile-button"/>
        {showMenu && (
        <ul className="profile-dropdown" ref={dropdownRef} onMouseOver={toggleMenu} >


          <li onClick={logout} id='logout'>Log Out

          </li>
        </ul>
      )}
      </div>
    
    </>
  );
}

export default ProfileButton;