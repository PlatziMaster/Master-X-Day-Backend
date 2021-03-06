const $app = document.getElementById('app');
const scripts = document.getElementsByTagName("script")
const domain = scripts[scripts.length - 1].getAttribute("src").split("?")[1].split('=')[1]
const API = `http://159.203.118.150:8000/api/${domain}`;


/** Obtain data from external resource parametrized with domain object.
 *
 */
const consumerData = () => {
    fetch(API, { mode: 'no-cors'})
        .then(response => response.json())
        .then(response => {
            const instances = response.results
            console.log(instances)
            let output = instances.map(singleInstance => {
                try {
                    let printedContent = `<div class="grid-item"> `;
                    singleInstance.map((key, value) => {
                        printedContent += ` <h4 class="component-key"> ${key}: </h4> <h4 class="component-value">> `
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

setTimeout(consumerData(), 1000)
