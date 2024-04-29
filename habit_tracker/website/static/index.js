function deleteHabit(habitId) {
    fetch("/delete-habit", {
        method: "POST",
        body: JSON.stringify({ habitId: habitId }),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then((_res) => {
        window.location.href = "/home";
    });
}

document.addEventListener('DOMContentLoaded', function () {
    console.log("Document ready!");

    document.querySelectorAll('.save-edit').forEach(button => {
        button.addEventListener('click', function(event) {
            event.preventDefault();  // Prevent default form submission
            console.log("Save button clicked");

            const habitId = this.getAttribute('data-habit-id');
            const nameCell = document.querySelector(`td[data-habit-id="${habitId}"][data-field="name"]`);
            const moodCell = document.querySelector(`td[data-habit-id="${habitId}"][data-field="mood"]`);
            const dateCell = document.querySelector(`td[data-habit-id="${habitId}"][data-field="date"]`);
            const commentsCell = document.querySelector(`td[data-habit-id="${habitId}"][data-field="comments"]`);

            const updatedName = nameCell.textContent.trim();
            const updatedMood = parseInt(moodCell.textContent.trim());
            const updatedDate = dateCell.textContent.trim();
            const updatedComments = commentsCell.textContent.trim();

            // Validate date format (YYYY-MM-DD)
            if (!/^\d{4}-\d{2}-\d{2}$/.test(updatedDate)) {
                alert("Date format must be YYYY-MM-DD");
                return;  // Stop execution if the date format is wrong
            }

            console.log("Sending data to server:", {
                habitId, name: updatedName, mood: updatedMood, date_of_entry: updatedDate, comments: updatedComments
            });

            fetch("/edit-habit", {
                method: "POST",
                body: JSON.stringify({
                    habitId: habitId,
                    name: updatedName,
                    mood: updatedMood,
                    date_of_entry: updatedDate,
                    comments: updatedComments
                }),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => response.json())
            .then(data => {
                console.log("Response data:", data);
                if (data.message) {
                    alert("Habit updated successfully!");
                    updateRowColor(moodCell, updatedMood);
                } else {
                    alert("Failed to update habit: " + data.error);
                }
            })
            .catch(error => {
                console.error("Error updating habit:", error);
                alert("Error updating habit, check console for more information.");
            });
        });
    });
});

function updateRowColor(moodCell, mood) {
    const hue = 24 * (mood - 1);  // Adjust for green to red gradient
    const row = moodCell.parentNode;
    row.style.backgroundColor = `hsl(${hue}, 100%, 80%)`;
}
