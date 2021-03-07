const $app = document.getElementById('app');
const scripts = document.getElementsByTagName("script")
const domain = scripts[scripts.length - 1].getAttribute("src").split("?")[1].split('=')[1]
const API = `http://159.203.118.150:8000/api/${domain}`;


/** Obtain data from external resource parametrized with domain object.
 *
 */
const consumerData = () => {
    fetch(API, { headers: {'Content-Type': 'application/json'},})
        .then(response => response.json())
        .then(response => {
            const instances = response
            let output = instances.map(singleInstance => {
                try {
                    let printedContent = `<div class="grid-item"> `;
                    Object.entries(singleInstance).forEach(property => {
                        printedContent += `<div class="property-object"> <h4 class="component-key d-inline"> ${property[0]}: </h4> <h4 class="component-value d-inline"> ${property[1]}</h4></div>`
                    })
                    return ` ${printedContent}
                             </div> <br><br>`
                } catch (err) {
                    console.log(err.message)
                }
            }).join('');
            let newItem = document.createElement('div')
            newItem.classList.add('container-component')
            newItem.innerHTML = output;
            $app.appendChild(newItem);
        })
        .catch(error => {
            console.log(error)
            alert(`Could not find ${domain}`)
        })
}

/** Allow to render the fields where will be changed values.
 *
 */
setTimeout(consumerData(), 1000)
