export default function store(){
    return(
        <p>Welcome!</p>
    )
}

function Card({name,description}){
    return(
        <div className="card">
            <img src="./images"/>
            <div className="container">
                <h1>{name}</h1>
                <p>{description}</p>
            </div>
        </div>
    )
}