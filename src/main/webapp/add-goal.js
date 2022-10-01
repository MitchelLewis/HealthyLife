var counter = 1;

function addGoal(e) {
	e.preventDefault();
	const modalElement = document.getElementById('addGoalModal');
	const tableBody = document.getElementById('goal-table-body');
	const tableRow = document.createElement('tr');
	tableRow.id = `goal-${counter}`;
	const goalType = document.getElementById('goal-select').value;
	const goalValue = document.getElementById('goal-amount').value;
	const goalUnits = document.getElementById('units').innerText;
	tableRow.innerHTML = `<td class="align-middle">${goalType}</td>
      <td class="align-middle">${goalValue} ${goalUnits}</td>
      <td><button type="button" class="btn btn-secondary" onclick="removeGoal(${counter})")>Remove</button></td>`;
    tableBody.appendChild(tableRow);
    counter += 1;
   	if(modalElement) {
		var modal = bootstrap.Modal.getInstance(modalElement);
		modal.hide();
	}
	document.getElementById('next-btn').style.visibility = '';
}

function removeGoal(id) {
	document.getElementById(`goal-${id}`).remove();
	counter -= 1;
	if(counter == 1) {
		document.getElementById('next-btn').style.visibility = 'hidden';
	}
}

function addFormToDialog() {
	const element = document.createElement('div');
	element.innerHTML = `			        <form id="goal-entry-form">
			        <div class="form-group row mb-2">
			        	<label class="text-dark col-sm-4 col-form-label" for="goal-select">Goal</label>
			        	<select class="text-dark col-sm-4" aria-label="Goal type" id="goal-select" onchange="onChangeForGoalSelection();" required>
						  <option selected>Type</option>
						  <option value="Calories">Calories</option>
						  <option value="Protein">Protein</option>
						  <option value="Salt">Salt</option>
						  <option value="Sugar">Sugar</option>
						  <option value="Exercise">Exercise</option>
						  <option value="Working hours">Working hours</option>
						  <option value="Sleep">Sleep</option>
						</select>
						</div>
						<div class="form-group row">
			        	<label class="text-dark col-sm-4 col-form-label" for="amount">Amount</label>
			        	<input type="number" id="goal-amount" class="text-dark col-sm-4" required/>
			        	<p id="units" class="text-dark col-sm-4 text-start col-form-label"></p>
			        	</div>
			        </form>`;
	document.getElementById('modal-body').appendChild(element);
	document.getElementById('goal-entry-form').addEventListener('submit', addGoal);
	document.getElementById('addGoalModal').addEventListener('hidden.bs.modal', removeFormFromDialog);
}

function removeFormFromDialog() {
	document.getElementById('goal-entry-form').remove();
}

function submitForm() {
	document.getElementById('goal-entry-form').submit();
}

function onChangeForGoalSelection() {
	const selectElement = document.getElementById('goal-select');
	const unitsElement = document.getElementById('units');
	const selection = selectElement.value;
	switch(selection) {
		case 'Calories':
			unitsElement.innerText = 'kcals';
			break;
		case 'Protein':
		case 'Salt':
		case 'Sugar':
			unitsElement.innerText = 'grams';
			break;
		case 'Exercise':
			unitsElement.innerText = 'minutes';
			break;
		case 'Working hours':
		case 'Sleep':
			unitsElement.innerText = 'hours';
			break;
		default:
			unitsElement.innerText = '';
	}
}