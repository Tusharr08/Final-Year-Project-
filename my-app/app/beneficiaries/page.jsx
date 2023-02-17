export default function beneficiaries(){

    return(
        <div>
            <Card name="Mission Oxygen" description="Mission Oxygen is an initiative of the Democratic People Foundation. We have partnered with United Way India to enable people from outside India to contribute to the cause."/>
            <Card name="Mission Hunger" description="One in three of the world's malnourished children lives in India. Our children are going to school hungry. They suffer from lack of concentration and reduced cognitive development, directly leading to their dropping out of school. Join us in our mission to prevent hunger diminishing our children’s opportunities to succeed."/>
            <Card name="Give India Education" description="GiveIndia partners with the most credible nonprofits to make sure your donation does what it is supposed to - change lives.A donation of ₹600 a month can provide education to 1 girl."/>
        </div>
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