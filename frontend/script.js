// ==============================================
// Bus Reservation System
// script.js
// ==============================================

const API = "https://busreservationsystem-production-59bd.up.railway.app";


// ==============================================
// Navigation
// ==============================================

const sections = {

    dashboard: document.getElementById("dashboard-section"),
    passenger: document.getElementById("passenger-section"),
    bus: document.getElementById("bus-section"),
    conductor: document.getElementById("conductor-section"),
    ticket: document.getElementById("ticket-section"),
    reports: document.getElementById("reports-section")

};

const navItems = {

    dashboard: document.getElementById("nav-dashboard"),
    passenger: document.getElementById("nav-passenger"),
    bus: document.getElementById("nav-bus"),
    conductor: document.getElementById("nav-conductor"),
    ticket: document.getElementById("nav-ticket"),
    reports: document.getElementById("nav-reports")

};

function hideAllSections(){

    Object.values(sections).forEach(section=>{

        section.classList.add("hidden");

    });

}

function removeActive(){

    Object.values(navItems).forEach(item=>{

        item.classList.remove("active");

    });

}

function showSection(section){

    hideAllSections();

    removeActive();

    sections[section].classList.remove("hidden");

    navItems[section].classList.add("active");

}

Object.keys(navItems).forEach(item=>{

    navItems[item].addEventListener("click",function(e){

        e.preventDefault();

        showSection(item);

    });

});


// ==============================================
// Generic Fetch Function
// ==============================================

async function request(endpoint,method="GET",data=null){

    const options={

        method,

        headers:{

            "Content-Type":"application/json"

        }

    };

    if(data){

        options.body=JSON.stringify(data);

    }

    const response=await fetch(API+endpoint,options);

    return await response.json();

}


// ==============================================
// Dashboard
// ==============================================

async function loadDashboard(){

    try{

        const passengers=await request("/passengers");

        const buses=await request("/buses");

        const conductors=await request("/conductors");

        const tickets=await request("/tickets");

        document.getElementById("totalPassengers").textContent=passengers.count;

        document.getElementById("totalBuses").textContent=buses.count;

        document.getElementById("totalConductors").textContent=conductors.count;

        document.getElementById("totalTickets").textContent=tickets.count;

    }

    catch(error){

        console.log(error);

    }

}


// ==============================================
// Generic Helpers
// ==============================================

function clearFields(fields){

    fields.forEach(field=>{

        field.value="";

    });

}

function filterTable(inputId,tableBody){

    document.getElementById(inputId).addEventListener("keyup",function(){

        const value=this.value.toLowerCase();

        tableBody.querySelectorAll("tr").forEach(row=>{

            row.style.display=row.innerText
            .toLowerCase()
            .includes(value)

            ? ""

            : "none";

        });

    });

}


// ==============================================
// Initial Load
// ==============================================

showSection("dashboard");

loadDashboard();

// ==============================================
// Passenger Variables
// ==============================================

const pid = document.getElementById("pid");
const pfname = document.getElementById("pfname");
const plname = document.getElementById("plname");
const pgender = document.getElementById("pgender");
const page = document.getElementById("page");
const pphone = document.getElementById("pphone");
const pemail = document.getElementById("pemail");
const paddress = document.getElementById("paddress");

const passengerTableBody = document.getElementById("passengerTableBody");

const addPassenger = document.getElementById("addPassenger");
const updatePassenger = document.getElementById("updatePassenger");
const deletePassenger = document.getElementById("deletePassenger");
const clearPassenger = document.getElementById("clearPassenger");


// ==============================================
// Load Passengers
// ==============================================

async function loadPassengers(){

    const result = await request("/passengers");

    passengerTableBody.innerHTML = "";

    result.data.forEach(passenger=>{

        const row=document.createElement("tr");

        row.innerHTML=`

        <td>${passenger.p_id}</td>
        <td>${passenger.first_name}</td>
        <td>${passenger.last_name}</td>
        <td>${passenger.gender}</td>
        <td>${passenger.age}</td>
        <td>${passenger.phone}</td>
        <td>${passenger.email}</td>
        <td>${passenger.address}</td>

        `;

        row.onclick=function(){

            fillPassenger(passenger);

        };

        passengerTableBody.appendChild(row);

    });

}


// ==============================================
// Fill Form
// ==============================================

function fillPassenger(passenger){

    pid.value=passenger.p_id;

    pfname.value=passenger.first_name;

    plname.value=passenger.last_name;

    pgender.value=passenger.gender;

    page.value=passenger.age;

    pphone.value=passenger.phone;

    pemail.value=passenger.email;

    paddress.value=passenger.address;

}


// ==============================================
// Add Passenger
// ==============================================

addPassenger.onclick=async function(){

    const passenger={

        first_name:pfname.value,

        last_name:plname.value,

        gender:pgender.value,

        age:Number(page.value),

        phone:pphone.value,

        email:pemail.value,

        address:paddress.value

    };

    const result=await request(

        "/passengers",

        "POST",

        passenger

    );

    alert(result.message);

    clearPassengerForm();

    loadPassengers();

    loadDashboard();

};


// ==============================================
// Update Passenger
// ==============================================

updatePassenger.onclick=async function(){

    if(pid.value===""){

        alert("Select Passenger");

        return;

    }

    const passenger={

        first_name:pfname.value,

        last_name:plname.value,

        gender:pgender.value,

        age:Number(page.value),

        phone:pphone.value,

        email:pemail.value,

        address:paddress.value

    };

    const result=await request(

        "/passengers?id="+pid.value,

        "PUT",

        passenger

    );

    alert(result.message);

    clearPassengerForm();

    loadPassengers();

    loadDashboard();

};

