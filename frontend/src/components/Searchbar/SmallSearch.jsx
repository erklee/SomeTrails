import { useDispatch } from "react-redux";
import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { fetchTrailSearch } from "../../store/search";
import "./SmallSearch.css"


function SmallSearchBar() {
    const dispatch = useDispatch()
    const [search, setSearch] = useState('')
    const navigate = useNavigate()

    
    const handleSearch = () => {
        if (search.trim() !== '') {
            dispatch(fetchTrailSearch(search))
            // navigate("/trails/search");
        }
    }

    const handleEnter = e => {
        if (e.key === "Enter") {
            e.preventDefault()
            handleSearch()
            navigate('/trails/search')
        }
    }

    return (
        <>
            <div className="search-bar-small">
                <input 
                type="text" 
                placeholder="Enter trail or park name" 
                value={search} 
                onChange={(e) => setSearch(e.target.value)}
                onKeyDown={handleEnter} 
                />
                {/* <button onClick={handleSearch}>Search</button> */}
                {/* <Link to="/trails/search" id="searchBarButton"></Link> */}
            </div>
        </>
    )
}

export default SmallSearchBar