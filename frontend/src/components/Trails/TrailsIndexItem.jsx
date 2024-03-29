import './TrailsIndexItem.css'
import { Link } from 'react-router-dom'
import { useSelector } from 'react-redux'
import AvgRating from '../Ratings/AvgRating' 

function TrailsIndexItem({trail}){

    const currentUser = useSelector(state => state?.session.user)

    return (
        <div>

            <div id='trail-wrapper'>
                <ul id='ultrailitemindex'>
                    <Link to={ currentUser ? `/trails/${trail.id}`: '/signUp' }><img src= {trail.photoUrl} alt="trail" id="trailimage"/></Link>
                    
                    <Link to={currentUser? `/trails/${trail.id}`: '/signUp'} style={{ textDecoration: 'none' }}>
                        <p id='home-trail-name'>{trail.name}</p>
                        <ul id='splash-page-trail'> 
                        <li>&#9733; <AvgRating trail={trail}/> &bull; {trail.length}mi &bull; {trail.difficulty}</li>
                        </ul>
                    </Link>
                </ul>
            </div>
            <div className='splashfooter'></div>
        </div>
    )
}

export default TrailsIndexItem