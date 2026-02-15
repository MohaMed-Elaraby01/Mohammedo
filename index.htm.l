<!DOCTYPE html>
<html lang="ar">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Club Rules 𖹭</title>
<link rel="stylesheet" href="style.css">
<link rel="icon" href="icon.png">
</head>
<body>

<div class="container">

    <header>
        <h1>Friends🧃</h1>

        <div class="header-buttons">

            <!-- زر الرسائل -->
            <button id="messageBtn" class="icon-btn">
                ✉️
                <small>رسالة</small>
            </button>

            <!-- زر الأعضاء -->
            <button id="membersBtn" class="members-btn">
                <span></span>
                <span></span>
                <span></span>
                <small>الأعضاء</small>
            </button>

        </div>
    </header>

    <div class="layout">

        <!-- القوانين - يمين -->
        <section class="rules">
            <h2>قوانين الكلان</h2>

            <div class="card">
                غياب 3 أيام = <span class="danger">طرد</span>
            </div>

            <div class="card">لعب الأحداث.</div>
            <div class="card">احترام الآخرين.</div>
            <div class="card">ممنوع تعدي الحدود مع الجنس الآخر.</div>

            <div class="promotion-title">قوانين الترقية</div>

            <div class="card promotion">التفاعل في الشات.</div>
            <div class="card promotion">الفوز في الفعاليات الأسبوعية.</div>
            <div class="card promotion">الثبات في الاتحاد.</div>
        </section>

        <!-- الأعضاء - شمال -->
        <section class="members" id="membersPanel">
            <div class="counter">
                <span id="memberCount">0</span>/30
            </div>
            <div id="membersList"></div>
        </section>

    </div>

</div>

<!-- مودالات الرسائل -->
<div class="modal" id="newMessageModal">
  <div class="modal-box">
    <h3>إرسال رسالة</h3>
    <input type="text" id="senderName" placeholder="اكتب اسمك">
    <textarea id="messageInput" placeholder="اكتب رسالتك"></textarea>
    <div class="modal-buttons">
      <button id="sendMessageBtn">إرسال</button>
      <button id="closeNewMessage">إلغاء</button>
    </div>
  </div>
</div>

<div class="modal" id="emptyNameModal">
  <div class="modal-box small">
    <p>عفواً، اكتب اسمك أولاً.</p>
    <button id="closeEmptyName">رجوع</button>
  </div>
</div>

<div class="modal" id="emptyMessageModal">
  <div class="modal-box small">
    <p>عفواً، اكتب رسالتك أولاً.</p>
    <button id="closeEmptyMessage">رجوع</button>
  </div>
</div>

<div class="modal" id="successModal">
  <div class="modal-box small">
    <p>تم إرسال الرسالة بنجاح ✅</p>
    <button id="closeSuccess">حسناً</button>
  </div>
</div>

<script src="script.js"></script>
</body>
</html>
