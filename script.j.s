// ===== أعضاء الكلان =====
const members = [
    { name: "Medy", role: "الرئيس" },
    { name: "Sh", role: "نائب" },
    { name: "Hazzem♡", role: "وكيل" },
    { name: "نوال", role: "نائب" },
    { name: "Moaaz", role: "نائب" }
];

const membersPanel = document.getElementById("membersPanel");
const membersBtn = document.getElementById("membersBtn");
const membersList = document.getElementById("membersList");
const memberCount = document.getElementById("memberCount");

membersBtn.addEventListener("click", () => {
    membersPanel.classList.toggle("active");
});

members.forEach(member => {
    const div = document.createElement("div");
    div.classList.add("member");
    div.innerHTML = `
        <span>${member.name}</span>
        <span class="role">${member.role}</span>
    `;
    membersList.appendChild(div);
});

memberCount.textContent = members.length;

// ===== مودال الرسائل =====
const messageBtn = document.getElementById("messageBtn");
const newMessageModal = document.getElementById("newMessageModal");
const emptyNameModal = document.getElementById("emptyNameModal");
const emptyMessageModal = document.getElementById("emptyMessageModal");
const successModal = document.getElementById("successModal");

const closeNewMessage = document.getElementById("closeNewMessage");
const closeEmptyName = document.getElementById("closeEmptyName");
const closeEmptyMessage = document.getElementById("closeEmptyMessage");
const closeSuccess = document.getElementById("closeSuccess");

const sendMessageBtn = document.getElementById("sendMessageBtn");
const senderName = document.getElementById("senderName");
const messageInput = document.getElementById("messageInput");

// فتح / غلق المودال
function openModal(id) { document.getElementById(id).classList.add("active"); }
function closeModal(id) { document.getElementById(id).classList.remove("active"); }

messageBtn.addEventListener("click", e => {
  e.stopPropagation();
  openModal("newMessageModal");
  messageInput.value = "";
  senderName.value = "";
});

closeNewMessage.addEventListener("click", () =>
  closeModal("newMessageModal")
);

sendMessageBtn.addEventListener("click", () => {
  const name = senderName.value.trim();
  const message = messageInput.value.trim();

  if (!name) {
    closeModal("newMessageModal");
    openModal("emptyNameModal");
    return;
  }

  if (!message) {
    closeModal("newMessageModal");
    openModal("emptyMessageModal");
    return;
  }

  const finalMessage = `${message} - ${name} - Brawl Stars`;

  const formURL =
    "https://docs.google.com/forms/d/e/1FAIpQLSc_UhUjJ86Ft3KhcHL1EMS2j3Ps75ZujAns287XY66BY7bQ0A/formResponse";
  const entryID = "214003542";

  fetch(
    `${formURL}?entry.${entryID}=${encodeURIComponent(finalMessage)}`,
    { method: "POST", mode: "no-cors" }
  ).then(() => {
    closeModal("newMessageModal");
    messageInput.value = "";
    senderName.value = "";
    openModal("successModal");
  });
});

closeEmptyMessage.addEventListener("click", () => {
  closeModal("emptyMessageModal");
  openModal("newMessageModal");
});

closeEmptyName.addEventListener("click", () => {
  closeModal("emptyNameModal");
  openModal("newMessageModal");
});

closeSuccess.addEventListener("click", () => closeModal("successModal"));
