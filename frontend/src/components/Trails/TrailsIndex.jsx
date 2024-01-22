import { useDispatch, useSelector } from "react-redux"
import {fetchTrails} from '../../store/trail'
import { useEffect } from "react"
import TrailIndexItem from "./TrailsIndexItem"
import { trailsArray } from "../../store/trail"
import "./TrailsIndex.css";
import splash from "../../../images/indeximage.avif" 
import { Link } from "react-router-dom"



function TrailsIndex(){
    const trails = useSelector(trailsArray)

    const dispatch = useDispatch()

    useEffect(() => {
       dispatch(fetchTrails())
    }, [dispatch]);
    return(
        <>
            <img src={splash} alt="splashbackground" id="splashbackground"/>
                <div className="parentwrapper">
                        <div id="newyorkfavorite">
                            <h1 id="TrailIndexHeader">
                                <Link to={'trails'} id="newyorkfavoritelink">New York Favorites</Link>
                            </h1>
                            
                        </div>
                        <br />
                        <div id="trailsIndexWrapper">
                            {trails.slice(0,3).map(trail => 
                                <TrailIndexItem key={trail.id} trail={trail}/>)}
                            <Link to='/trails' id="showIndexBoxLink">
                                <div id='showIndexBox'>
                                <h1 id='showIndexBoxContent'>Show More</h1>
                                </div>
                            </Link>
                        </div>
    
                </div>
            <div className='trailsindexfooter'>

            </div>
        
        </>
    )
}
export default TrailsIndex