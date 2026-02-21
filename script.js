const startScreen = document.getElementById("startScreen");
const startBtn = document.getElementById("startBtn");

const quizScreen = document.getElementById("quizScreen");
const questionEl = document.getElementById("question");
const mainImage = document.getElementById("mainImage");
const btn1 = document.getElementById("btn1");
const btn2 = document.getElementById("btn2");
const buttons = document.getElementById("buttons");
const gifBox = document.getElementById("gifBox");

const wrongScreen = document.getElementById("wrongScreen");
const wrongMessage = document.getElementById("wrongMessage");
const wrongGif = document.getElementById("wrongGif");
const goGoogle = document.getElementById("goGoogle");
const goBack = document.getElementById("goBack");

const songModal = document.getElementById("songModal");
const progressBar = document.getElementById("progress");
const timerEl = document.getElementById("timer");
const audio = document.getElementById("songAudio");

let currentQuestion = 0;
let timerInterval;

const questions = [
  { question: "هَي بتحبي محمد؟ 💖", image: "q1.gif", answers: ["آه طبعًا 😍", "لا"], correct: 0, wrongType: "google" },
  { question: "زعلتي من محمد قبل كدا؟", image: "q2.gif", answers: ["ايوه", "لا"], correct: 1, wrongType: "apology" },
  { question: "طيب هو محمد بيحبك؟", image: "q3.gif", answers: ["أكيد 💕", "مش عارفة 🤨"], correct: 0, wrongType: "normal" },
  { question: "محمد ولا أصحابك؟", image: "q4.gif", answers: ["مممم محمد", "أصحابي اكيد"], correct: 0, wrongType: "normal" }
];

// بدء الأسئلة
startBtn.onclick = () => {
  startScreen.style.display = "none";
  quizScreen.style.display = "block";
  loadQuestion();
};

// تحميل السؤال
function loadQuestion() {
  const q = questions[currentQuestion];
  questionEl.innerText = q.question;
  mainImage.src = q.image;

  const options = [
    { text: q.answers[0], index: 0 },
    { text: q.answers[1], index: 1 }
  ].sort(() => Math.random() - 0.5);

  btn1.innerText = options[0].text;
  btn2.innerText = options[1].text;

  btn1.onclick = () => checkAnswer(options[0].index, options[0].text);
  btn2.onclick = () => checkAnswer(options[1].index, options[1].text);
}

// التحقق من الإجابة
function checkAnswer(selectedIndex, btnText) {
  const q = questions[currentQuestion];

  if(currentQuestion===3 && btnText==="أصحابي اكيد"){
    window.location.href="https://www.google.com";
    return;
  }

  if (selectedIndex === q.correct) {
    currentQuestion++;
    if (currentQuestion < questions.length) loadQuestion();
    else { quizScreen.style.display="none"; showSongModal(); }
  } else { handleWrong(q.wrongType); }
}

// شاشة الغلط
function handleWrong(type){
  quizScreen.style.display="none";
  wrongScreen.style.display="block";
  goGoogle.style.display="none";

  if(type==="google"){ wrongMessage.innerText="💢 💢 💢"; wrongGif.src="exit.gif"; goGoogle.style.display="block"; }
  else if(type==="apology"){ wrongMessage.innerText="ليه خير؟ والله يبعد قلبي مكانشي قصدي أزعلك خالص ولو زعلتك في مرة ف دا غصب عني والله ❤️"; wrongGif.src="hello-kitty-crying.gif"; }
  else{ wrongMessage.innerText="يسلام؟"; wrongGif.src="hello-kitty-crying.gif"; }

  if(currentQuestion===0){ goBack.innerText="ارجعي وعيدي يحيوانة"; goBack.style.background="#ff69b4"; goBack.style.fontSize="20px"; }
  else{ goBack.innerText="كملي"; goBack.style.background="#ffb3d9"; goBack.style.fontSize="18px"; }
}

goGoogle.onclick = ()=>window.location.href="https://www.google.com";
goBack.onclick = ()=>{
  wrongScreen.style.display="none";
  quizScreen.style.display="block";
};

// موديل الأغنية المفضلة
function showSongModal(){
  songModal.style.display="block";
  audio.play().catch(()=>{
    songModal.addEventListener('click',()=>{ audio.play(); }, { once:true });
  });

  clearInterval(timerInterval);
  timerInterval=setInterval(()=>{
    let duration=audio.duration||30;
    let current=audio.currentTime;
    let percent=(current/duration)*100;
    progressBar.style.width=percent+"%";
    let minutes=Math.floor(current/60);
    let seconds=Math.floor(current%60);
    timerEl.innerText=`${minutes}:${seconds<10?"0"+seconds:seconds}`;
    if(audio.ended) clearInterval(timerInterval);
  },200);
}