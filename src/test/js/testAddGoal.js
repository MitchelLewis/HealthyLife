/* global expect, onChangeForGoalSelection */
const jsdom = require("jsdom");
var fs = require('fs');
var vm = require('vm');
var expect = require('chai')
    .expect;
var code = fs.readFileSync('../../main/webapp/add-goal.js');
vm.runInThisContext(code);
describe('Add Goal', function() {
	
	const dom = new jsdom.JSDOM(`<!DOCTYPE html><body></body>`);
	doc = dom.window.document;
	global.window = dom.window;
	global.document = dom.window.document;
	
	beforeEach(() => {
		if(doc.getElementById('test-container')) {
		doc.getElementById('test-container').remove();
		}
		const testParent = doc.createElement('div');
		testParent.id = 'test-container';
		
		testParent.innerHTML = `<form id="goal-entry-form">
			        <div class="form-group row mb-2">
			        	<label class="text-dark col-sm-4 col-form-label" for="goal-select">Goal</label>
			        	<select class="text-dark col-sm-4" aria-label="Goal type" id="goal-select" onchange="onChangeForGoalSelection(document);" required>
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
			        </form>
			        <div class="modal fade" id="addGoalModalTest" aria-labelledby="addGoalModalLabel">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title text-dark" id="addGoalModalLabel">Add goal</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" id="modal-body">
			       
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="removeFormFromDialog()">Close</button>
			        <input id="submit-btn" type="submit" class="btn btn-primary" form="goal-entry-form" value="Update"/>
			      </div>
			    </div>
			  </div>
			</div>`;
		doc.body.appendChild(testParent);
	});
	
  	it('should return grams when the option is protein/salt/sugar', function() {
		doc.getElementById('goal-select').value = 'Protein';
	    var result = onChangeForGoalSelection();
	   	expect(doc.getElementById('units').innerText).to.equal('grams');
	   	doc.getElementById('goal-select').value = 'Salt';
	   	result = onChangeForGoalSelection();
	   	expect(doc.getElementById('units').innerText).to.equal('grams');
	   	doc.getElementById('goal-select').value = 'Sugar';
	   	result = onChangeForGoalSelection();
	   	expect(doc.getElementById('units').innerText).to.equal('grams');
  	});
  	
  	it('should return hours when the option is working hours/sleep', function() {
		doc.getElementById('goal-select').value = 'Working hours';
	    var result = onChangeForGoalSelection();
	   	expect(doc.getElementById('units').innerText).to.equal('hours');
	   	doc.getElementById('goal-select').value = 'Sleep';
	   	result = onChangeForGoalSelection();
	   	expect(doc.getElementById('units').innerText).to.equal('hours');
  	});
  	
  	it('should return kcals when the option is calories', function() {
		doc.getElementById('goal-select').value = 'Calories';
	    var result = onChangeForGoalSelection();
	   	expect(doc.getElementById('units').innerText).to.equal('kcals');
  	});
  	
  	it('should return minutes when the option is working exercise', function() {
		doc.getElementById('goal-select').value = 'Exercise';
	    var result = onChangeForGoalSelection();
	   	expect(doc.getElementById('units').innerText).to.equal('minutes');

  	});
  	
  	it('should remove the form from the modal when requested', function() {
		expect(!!doc.getElementById('goal-entry-form')).to.be.true;
		removeFormFromDialog();
		expect(!!doc.getElementById('goal-entry-form')).to.be.false;
	});
	
  	it('should remove specified goal from the window when requested', function() {
		const element = doc.createElement('table');
		element.innerHTML = `				 
				  <thead>
				    <tr>
				      <th scope="col">Goal type</th>
				      <th scope="col">Amount</th>
				      <th scope="col"></th>
				    </tr>
				  </thead>
				  <tbody id="goal-table-body">
				  <tr id="goal-1">
				  	<td class="align-middle">Calories</td>
      				<td class="align-middle">1 kcals</td>
      				<td></td>
      			  </tr>
  				  <tr id="goal-2">
				  	<td class="align-middle">Calories</td>
      				<td class="align-middle">1 kcals</td>
      				<td></td>
      			  </tr>
				  </tbody>`;
		doc.body.appendChild(element);
		expect(!!doc.getElementById('goal-1')).to.be.true;
		expect(!!doc.getElementById('goal-2')).to.be.true;
		removeGoal(1);
		expect(!!doc.getElementById('goal-1')).to.be.false;
		expect(!!doc.getElementById('goal-2')).to.be.true;
	});
	
  	it('should add goals to the table', function() {
		counter = 1;
		doc.getElementById('goal-2').remove();
		window.HTMLFormElement.prototype.submit = () => {}
		doc.getElementById('goal-select').value = 'Protein';
		doc.getElementById('goal-amount').value = '1';
		onChangeForGoalSelection();
		addGoal(new Event('submit'));
      	expect(doc.getElementById('goal-1').querySelectorAll('td')[0].innerHTML).to.equal('Protein');
      	expect(doc.getElementById('goal-1').querySelectorAll('td')[1].innerHTML).to.equal('1 grams');
	});
	
  	it('should remove goals from the table', function() {
		expect(!!doc.getElementById('goal-1')).to.be.true;
		expect(counter).to.equal(2);
		removeGoal(1);
      	expect(counter).to.equal(1);
      	expect(!!doc.getElementById('goal-1')).to.be.false;
	});
	
	it('should add the form to the modal dialog', function () {
		doc.getElementById('goal-entry-form').remove();
		doc.getElementById('addGoalModalTest').id = 'addGoalModal';
		expect(!!doc.getElementById('goal-entry-form')).to.be.false;
		addFormToDialog();
		expect(!!doc.getElementById('goal-entry-form')).to.be.true;
	});

});
