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


// ==============================================
// Delete Passenger
// ==============================================

deletePassenger.onclick=async function(){

    if(pid.value===""){

        alert("Select Passenger");

        return;

    }

    if(!confirm("Delete Passenger?")){

        return;

    }

    const result=await request(

        "/passengers?id="+pid.value,

        "DELETE"

    );

    alert(result.message);

    clearPassengerForm();

    loadPassengers();

    loadDashboard();

};


// ==============================================
// Clear Form
// ==============================================

function clearPassengerForm(){

    clearFields([

        pid,

        pfname,

        plname,

        pgender,

        page,

        pphone,

        pemail,

        paddress

    ]);

}


// ==============================================
// Search
// ==============================================

filterTable(

    "searchPassenger",

    passengerTableBody

);


// ==============================================
// Initial Passenger Load
// ==============================================

loadPassengers();

// ==============================================
// Bus Variables
// ==============================================

const bid = document.getElementById("bid");
const bnumber = document.getElementById("bnumber");
const bname = document.getElementById("bname");
const btype = document.getElementById("btype");
const bseats = document.getElementById("bseats");
const bsource = document.getElementById("bsource");
const bdestination = document.getElementById("bdestination");
const bdeparture = document.getElementById("bdeparture");
const barrival = document.getElementById("barrival");

const busTableBody = document.getElementById("busTableBody");

const addBus = document.getElementById("addBus");
const updateBus = document.getElementById("updateBus");
const deleteBus = document.getElementById("deleteBus");
const clearBus = document.getElementById("clearBus");


// ==============================================
// Load Buses
// ==============================================

async function loadBuses(){

    const result = await request("/buses");

    busTableBody.innerHTML = "";

    result.data.forEach(bus=>{

        const row=document.createElement("tr");

        row.innerHTML=`

            <td>${bus.b_number}</td>
            <td>${bus.bus_name}</td>
            <td>${bus.bus_type}</td>
            <td>${bus.total_seats}</td>
            <td>${bus.source}</td>
            <td>${bus.destination}</td>
            <td>${bus.departure_time}</td>
            <td>${bus.arrival_time}</td>

        `;

        row.onclick=function(){

            fillBus(bus);

        };

        busTableBody.appendChild(row);

    });

}


// ==============================================
// Fill Form
// ==============================================

function fillBus(bus){

    bid.value = bus.b_id;

    bnumber.value = bus.b_number;

    bname.value = bus.bus_name;

    btype.value = bus.bus_type;

    bseats.value = bus.total_seats;

    bsource.value = bus.source;

    bdestination.value = bus.destination;

    bdeparture.value = bus.departure_time;

    barrival.value = bus.arrival_time;

}


// ==============================================
// Add Bus
// ==============================================

addBus.onclick=async function(){

    const bus={

        b_number:bnumber.value,

        bus_name:bname.value,

        bus_type:btype.value,

        total_seats:Number(bseats.value),

        source:bsource.value,

        destination:bdestination.value,

        departure_time:bdeparture.value,

        arrival_time:barrival.value

    };

    const result=await request(

        "/buses",

        "POST",

        bus

    );

    alert(result.message);

    clearBusForm();

    loadBuses();

    loadDashboard();

};


// ==============================================
// Update Bus
// ==============================================

updateBus.onclick=async function(){

    if(bid.value===""){

        alert("Select Bus");

        return;

    }

    const bus={

        b_number:bnumber.value,

        bus_name:bname.value,

        bus_type:btype.value,

        total_seats:Number(bseats.value),

        source:bsource.value,

        destination:bdestination.value,

        departure_time:bdeparture.value,

        arrival_time:barrival.value

    };

    const result=await request(

        "/buses?id="+bid.value,

        "PUT",

        bus

    );

    alert(result.message);

    clearBusForm();

    loadBuses();

    loadDashboard();

};


// ==============================================
// Delete Bus
// ==============================================

deleteBus.onclick=async function(){

    if(bid.value===""){

        alert("Select Bus");

        return;

    }

    if(!confirm("Delete Bus?")){

        return;

    }

    const result=await request(

        "/buses?id="+bid.value,

        "DELETE"

    );

    alert(result.message);

    clearBusForm();

    loadBuses();

    loadDashboard();

};


// ==============================================
// Clear Form
// ==============================================

function clearBusForm(){

    clearFields([

        bid,

        bnumber,

        bname,

        btype,

        bseats,

        bsource,

        bdestination,

        bdeparture,

        barrival

    ]);

}


// ==============================================
// Search
// ==============================================

filterTable(

    "searchBus",

    busTableBody

);


// ==============================================
// Initial Bus Load
// ==============================================

loadBuses();

// ==============================================
// Conductor Variables
// ==============================================

const cid = document.getElementById("cid");

const cfname = document.getElementById("cfname");
const clname = document.getElementById("clname");
const cphone = document.getElementById("cphone");
const cemail = document.getElementById("cemail");
const cexperience = document.getElementById("cexperience");

const conductorTableBody =
document.getElementById("conductorTableBody");

const addConductor =
document.getElementById("addConductor");

const updateConductor =
document.getElementById("updateConductor");

const deleteConductor =
document.getElementById("deleteConductor");

const clearConductor =
document.getElementById("clearConductor");


// ==============================================
// Load Conductors
// ==============================================

async function loadConductors(){

    const result = await request("/conductors");

    conductorTableBody.innerHTML = "";

    result.data.forEach(conductor=>{

        const row = document.createElement("tr");

        row.innerHTML = `

            <td>${conductor.c_id}</td>

            <td>${conductor.first_name}</td>

            <td>${conductor.last_name}</td>

            <td>${conductor.phone}</td>

            <td>${conductor.email}</td>

            <td>${conductor.experience_years}</td>

        `;

        row.onclick = function(){

            fillConductor(conductor);

        };

        conductorTableBody.appendChild(row);

    });

}


// ==============================================
// Fill Form
// ==============================================

function fillConductor(conductor){

    cid.value = conductor.c_id;

    cfname.value = conductor.first_name;

    clname.value = conductor.last_name;

    cphone.value = conductor.phone;

    cemail.value = conductor.email;

    cexperience.value = conductor.experience_years;

}


// ==============================================
// Add Conductor
// ==============================================

addConductor.onclick = async function(){

    const conductor = {

        first_name: cfname.value,

        last_name: clname.value,

        phone: cphone.value,

        email: cemail.value,

        experience_years: Number(cexperience.value)

    };

    const result = await request(

        "/conductors",

        "POST",

        conductor

    );

    alert(result.message);

    clearConductorForm();

    loadConductors();

    loadDashboard();

};


// ==============================================
// Update Conductor
// ==============================================

updateConductor.onclick = async function(){

    if(cid.value===""){

        alert("Select Conductor");

        return;

    }

    const conductor = {

        first_name: cfname.value,

        last_name: clname.value,

        phone: cphone.value,

        email: cemail.value,

        experience_years:Number(cexperience.value)

    };

    const result = await request(

        "/conductors?id="+cid.value,

        "PUT",

        conductor

    );

    alert(result.message);

    clearConductorForm();

    loadConductors();

    loadDashboard();

};


// ==============================================
// Delete Conductor
// ==============================================

deleteConductor.onclick = async function(){

    if(cid.value===""){

        alert("Select Conductor");

        return;

    }

    if(!confirm("Delete Conductor?")){

        return;

    }

    const result = await request(

        "/conductors?id="+cid.value,

        "DELETE"

    );

    alert(result.message);

    clearConductorForm();

    loadConductors();

    loadDashboard();

};


// ==============================================
// Clear Form
// ==============================================

function clearConductorForm(){

    clearFields([

        cid,

        cfname,

        clname,

        cphone,

        cemail,

        cexperience

    ]);

}


// ==============================================
// Search
// ==============================================

filterTable(

    "searchConductor",

    conductorTableBody

);


// ==============================================
// Initial Load
// ==============================================

loadConductors();

// ==============================================
// Ticket Variables
// ==============================================

const tid = document.getElementById("tid");

const tticketnumber = document.getElementById("tticketnumber");
const tbookingdate = document.getElementById("tbookingdate");
const tjourneydate = document.getElementById("tjourneydate");
const tseatnumber = document.getElementById("tseatnumber");
const tfare = document.getElementById("tfare");

const ticketTableBody = document.getElementById("ticketTableBody");

const addTicket = document.getElementById("addTicket");
const updateTicket = document.getElementById("updateTicket");
const deleteTicket = document.getElementById("deleteTicket");
const clearTicket = document.getElementById("clearTicket");


// ==============================================
// Load Tickets
// ==============================================

async function loadTickets(){

    const result = await request("/tickets");

    ticketTableBody.innerHTML = "";

    result.data.forEach(ticket=>{

        const row=document.createElement("tr");

        row.innerHTML=`

            <td>${ticket.t_id}</td>

            <td>${ticket.ticket_number}</td>

            <td>${ticket.booking_date}</td>

            <td>${ticket.journey_date}</td>

            <td>${ticket.seat_number}</td>

            <td>${ticket.fare}</td>

        `;

        row.onclick=function(){

            fillTicket(ticket);

        };

        ticketTableBody.appendChild(row);

    });

}


// ==============================================
// Fill Ticket Form
// ==============================================

function fillTicket(ticket){

    tid.value=ticket.t_id;

    tticketnumber.value=ticket.ticket_number;

    tbookingdate.value=ticket.booking_date;

    tjourneydate.value=ticket.journey_date;

    tseatnumber.value=ticket.seat_number;

    tfare.value=ticket.fare;

}


// ==============================================
// Add Ticket
// ==============================================

addTicket.onclick=async function(){

    const ticket={

        ticket_number:tticketnumber.value,

        booking_date:tbookingdate.value,

        journey_date:tjourneydate.value,

        seat_number:tseatnumber.value,

        fare:Number(tfare.value)

    };

    const result=await request(

        "/tickets",

        "POST",

        ticket

    );

    alert(result.message);

    clearTicketForm();

    loadTickets();

    loadDashboard();

};


// ==============================================
// Update Ticket
// ==============================================

updateTicket.onclick=async function(){

    if(tid.value===""){

        alert("Select Ticket");

        return;

    }

    const ticket={

        ticket_number:tticketnumber.value,

        booking_date:tbookingdate.value,

        journey_date:tjourneydate.value,

        seat_number:tseatnumber.value,

        fare:Number(tfare.value)

    };

    const result=await request(

        "/tickets?id="+tid.value,

        "PUT",

        ticket

    );

    alert(result.message);

    clearTicketForm();

    loadTickets();

    loadDashboard();

};


// ==============================================
// Delete Ticket
// ==============================================

deleteTicket.onclick=async function(){

    if(tid.value===""){

        alert("Select Ticket");

        return;

    }

    if(!confirm("Delete Ticket?")){

        return;

    }

    const result=await request(

        "/tickets?id="+tid.value,

        "DELETE"

    );

    alert(result.message);

    clearTicketForm();

    loadTickets();

    loadDashboard();

};


// ==============================================
// Clear Ticket Form
// ==============================================

function clearTicketForm(){

    clearFields([

        tid,

        tticketnumber,

        tbookingdate,

        tjourneydate,

        tseatnumber,

        tfare

    ]);

}


// ==============================================
// Search Ticket
// ==============================================

filterTable(

    "searchTicket",

    ticketTableBody

);


// ==============================================
// Initial Load
// ==============================================

loadTickets();

// ==============================================
// Report Variables
// ==============================================

const reportTableBody =
document.getElementById("reportTableBody");

const passengerTicketReport =
document.getElementById("passengerTicketReport");

const passengerBusReport =
document.getElementById("passengerBusReport");

const conductorBusReport =
document.getElementById("conductorBusReport");


// ==============================================
// Generic Report Loader
// ==============================================

async function loadReport(endpoint){

    const result = await request(endpoint);

    reportTableBody.innerHTML = "";

    if(result.data.length===0){

        reportTableBody.innerHTML=`

            <tr>

                <td>No Records Found</td>

            </tr>

        `;

        return;

    }

    result.data.forEach(record=>{

        const row=document.createElement("tr");

        row.innerHTML=`

            <td>${Object.values(record).join(" | ")}</td>

        `;

        reportTableBody.appendChild(row);

    });

}


// ==============================================
// Passenger Ticket Report
// ==============================================

passengerTicketReport.onclick=function(){

    loadReport("/reports/passenger-ticket");

};


// ==============================================
// Passenger Bus Report
// ==============================================

passengerBusReport.onclick=function(){

    loadReport("/reports/passenger-bus");

};


// ==============================================
// Conductor Bus Report
// ==============================================

conductorBusReport.onclick=function(){

    loadReport("/reports/conductor-bus");

};


// ==============================================
// Refresh Everything
// ==============================================

async function refreshSystem(){

    await loadDashboard();

    await loadPassengers();

    await loadBuses();

    await loadConductors();

    await loadTickets();

}


// ==============================================
// Window Load
// ==============================================

window.onload=function(){

    showSection("dashboard");

    refreshSystem();

};


// ==============================================
// Clear Buttons
// ==============================================

clearPassenger.onclick=clearPassengerForm;

clearBus.onclick=clearBusForm;

clearConductor.onclick=clearConductorForm;

clearTicket.onclick=clearTicketForm;


// ==============================================
// End of File
// ==============================================
