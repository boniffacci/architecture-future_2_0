# Event Storming — ключевые события

## Медицинский домен публикует
- **PatientRegistered** — зарегистрирован новый пациент  
- **AppointmentScheduled** — запланирован приём  
- **TreatmentCompleted** — завершено лечение  
- **MedicalTestPerformed** — проведено медицинское исследование  

## Финансовый домен публикует
- **AccountCreated** — создан банковский счёт  
- **LoanContractSigned** — подписан кредитный договор  
- **PaymentProcessed** — обработан платёж  
- **TransactionCompleted** — завершена транзакция  

## ИИ-домен публикует
- **DiagnosisGenerated** — сгенерирован диагноз ИИ  
- **ResearchCompleted** — завершено исследование  
- **AIModelTrained** — обучена новая модель ИИ  
- **AnalysisAvailable** — доступны результаты анализа  

---

## Подписчики на события

### Бизнес-аналитика подписывается на
- **PatientRegistered** — для отчётов по пациентам  
- **TreatmentCompleted** — для анализа эффективности  
- **PaymentProcessed** — для финансовой аналитики  
- **DiagnosisGenerated** — для статистики диагнозов  

### Финансовый домен подписывается на
- **TreatmentCompleted** — для выставления счетов  
- **MedicalTestPerformed** — для учёта стоимости услуг  

### Медицинский домен подписывается на
- **DiagnosisGenerated** — для подтверждения диагнозов врачами  
- **AccountCreated** — для привязки счетов к пациентам  
