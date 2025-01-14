//declare an empty array to store tasks
let tasks = [];

function addTask() {
    const title = document.getElementById('task-title').value;
    const desc = document.getElementById('task-desc').value;
    const priority = document.getElementById('task-priority').value;

    //to check whether the title and desc are fill or not
    if (!title || !desc) {
        //pop up message for adding empty task
        alert('Please fill in both the title and description.');
        return;
    }

    // Create a new task object
    const task = {
        id: Date.now(), title, desc, priority, completed: false
    };

    //add new task to the array
    tasks.push(task);

    //reset value after adding task
    document.getElementById('task-title').value = '';
    document.getElementById('task-desc').value = '';
    
    //include the task list with new task
    renderTasks();
}

//show task list on the page
function renderTasks() {

    const taskList = document.getElementById('task-list');
    taskList.innerHTML = '';
    
    // Sort tasks by priority: high > medium > low
    tasks.sort((a, b) => {
        const priorityOrder = { high: 1, medium: 2, low: 3 };
        return priorityOrder[a.priority] - priorityOrder[b.priority];
    });
    tasks.forEach(task => {
        const taskEl = document.createElement('div');
        taskEl.className = `task ${task.completed ? 'completed' : ''}`;

        taskEl.innerHTML = `
            <div>
                <strong>${task.title}</strong> - ${task.desc} 
                <span>(${task.priority})</span>
            </div>
            <div>
                <button class="edit" onclick="editTask(${task.id})">Edit</button>
                <button class="delete" onclick="deleteTask(${task.id})">Delete</button>
                <button onclick="toggleComplete(${task.id})">${task.completed ? 'Unmark' : 'Complete'}</button>
            </div>
        `;
        taskList.appendChild(taskEl);
    });
}

function deleteTask(id) {
    tasks = tasks.filter(task => task.id !== id);
    renderTasks();
}

function toggleComplete(id) {
    tasks = tasks.map(task => {
        if (task.id === id) task.completed = !task.completed;
        return task;
    });
    renderTasks();
}

function editTask(id) {
    const task = tasks.find(task => task.id === id);
    if (task) {
        document.getElementById('task-title').value = task.title;
        document.getElementById('task-desc').value = task.desc;
        document.getElementById('task-priority').value = task.priority;
        deleteTask(id);
    }
}
