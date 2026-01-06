# Каталог доменных событий

## Формат событий

Все события используют общий формат:

```json
{
  "eventId": "uuid",
  "eventType": "string",
  "eventVersion": "integer",
  "timestamp": "ISO8601",
  "source": "domain.service",
  "correlationId": "uuid",
  "payload": {}
}


## Медицинские события

### PatientRegistered
**Контекст-источник:** Пациентское обслуживание  
**Семантика:** Новый пациент зарегистрирован в системе  

**Минимальный контракт:**
```json
{
  "patientId": "uuid",
  "firstName": "string",
  "lastName": "string",
  "dateOfBirth": "date",
  "email": "email",
  "phone": "string",
  "clinicId": "uuid",
  "registrationDate": "timestamp"
}

### AppointmentScheduled

**Контекст-источник:** Клинические операции  
**Семантика:** Назначен приём у врача  

**Минимальный контракт:**
```json
{
  "appointmentId": "uuid",
  "patientId": "uuid",
  "doctorId": "uuid",
  "clinicId": "uuid",
  "appointmentDate": "timestamp",
  "durationMinutes": "integer",
  "reason": "string",
  "status": "SCHEDULED"
}

### TreatmentCompleted

**Контекст-источник:** Пациентское обслуживание  
**Семантика:** Завершён курс лечения  

**Минимальный контракт:**
```json
{
  "treatmentId": "uuid",
  "patientId": "uuid",
  "diagnosis": "string",
  "treatmentType": "string",
  "startDate": "date",
  "endDate": "date",
  "totalCost": "decimal",
  "insuranceCoverage": "decimal",
  "outcome": "string"
}

## Финансовые события

### AccountCreated

**Контекст-источник:** Банковские операции  
**Семантика:** Создан новый банковский счёт  

**Минимальный контракт:**
```json
{
  "accountId": "uuid",
  "customerId": "uuid",
  "accountNumber": "string",
  "accountType": "CHECKING|SAVINGS|BUSINESS",
  "currency": "string",
  "openingDate": "date",
  "initialBalance": "decimal",
  "branchId": "uuid"
}

### LoanContractSigned

**Контекст-источник:** Банковские операции  
**Семантика:** Подписан кредитный договор  

**Минимальный контракт:**
```json
{
  "contractId": "uuid",
  "customerId": "uuid",
  "loanAmount": "decimal",
  "interestRate": "decimal",
  "termMonths": "integer",
  "monthlyPayment": "decimal",
  "startDate": "date",
  "endDate": "date",
  "purpose": "string"
}

### PaymentProcessed

**Контекст-источник:** Банковские операции  
**Семантика:** Обработан платёж  

**Минимальный контракт:**
```json
{
  "paymentId": "uuid",
  "fromAccountId": "uuid",
  "toAccountId": "uuid",
  "amount": "decimal",
  "currency": "string",
  "paymentDate": "timestamp",
  "paymentType": "TRANSFER|BILL_PAYMENT|LOAN_PAYMENT",
  "reference": "string",
  "status": "COMPLETED"
}

## ИИ-события

### DiagnosisGenerated

**Контекст-источник:** Диагностика и аналитика  
**Семантика:** ИИ сгенерировал диагноз  

**Минимальный контракт:**
```json
{
  "diagnosisId": "uuid",
  "patientId": "uuid",
  "modelId": "uuid",
  "modelVersion": "string",
  "diagnosisCode": "string",
  "diagnosisText": "string",
  "confidence": "decimal",
  "symptoms": ["string"],
  "recommendations": ["string"],
  "timestamp": "timestamp"
}

### AIModelTrained

**Контекст-источник:** Диагностика и аналитика  
**Семантика:** Обучена новая модель ИИ  

**Минимальный контракт:**
```json
{
  "modelId": "uuid",
  "modelName": "string",
  "modelType": "CLASSIFICATION|REGRESSION|CLUSTERING",
  "trainingDatasetSize": "integer",
  "accuracy": "decimal",
  "precision": "decimal",
  "recall": "decimal",
  "f1Score": "decimal",
  "trainingDurationHours": "decimal",
  "trainingCompletedAt": "timestamp"
}

### ResearchCompleted

**Контекст-источник:** Диагностика и аналитика  
**Семантика:** Завершено исследование  

**Минимальный контракт:**
```json
{
  "researchId": "uuid",
  "researchTopic": "string",
  "startDate": "date",
  "endDate": "date",
  "sampleSize": "integer",
  "findings": "string",
  "conclusions": ["string"],
  "published": "boolean",
  "researchers": ["uuid"]
}

## Аналитические события

### ReportGenerated

**Контекст-источник:** Бизнес-аналитика  
**Семантика:** Сгенерирован отчёт  

**Минимальный контракт:**
```json
{
  "reportId": "uuid",
  "reportType": "FINANCIAL|MEDICAL|OPERATIONAL",
  "periodStart": "date",
  "periodEnd": "date",
  "generatedBy": "uuid",
  "generationDate": "timestamp",
  "dataPoints": "integer",
  "format": "PDF|EXCEL|HTML"
}

### KPIUpdated

**Контекст-источник:** Бизнес-аналитика  
**Семантика:** Обновлены ключевые показатели  

**Минимальный контракт:**
```json
{
  "kpiId": "uuid",
  "kpiName": "string",
  "value": "decimal",
  "target": "decimal",
  "unit": "string",
  "calculationDate": "date",
  "trend": "UP|DOWN|STABLE",
  "departmentId": "uuid"
}
