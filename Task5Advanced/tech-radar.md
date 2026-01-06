# Расширенный технический радар

## Архитектурные паттерны и подходы

| Категория | Технология/Паттерн | Статус | Обоснование |
|-----------|-------------------|--------|-------------|
| Архитектура данных | Data Mesh | Adopt | Позволяет масштабировать управление данными, распределяя ответственность по доменам |
| Архитектура данных | Event-Driven Architecture | Adopt | Основа целевой архитектуры, обеспечивает слабую связанность и реактивность |
| Архитектура данных | Microservices | Adopt | Независимое развитие сервисов, соответствует доменной структуре |
| Архитектура данных | API-First Design | Adopt | Упрощает интеграцию новых бизнес-направлений |
| Инфраструктура | Cloud-Native | Adopt | Гибкое масштабирование, снижение CAPEX |
| Инфраструктура | Kubernetes | Adopt | Оркестрация контейнеров, стандарт для облачных приложений |
| Инфраструктура | Serverless | Trial | Для эпизодических нагрузок (отчёты, обработка событий) |
| Обработка данных | Stream Processing | Adopt | Near-real-time обработка событий |
| Обработка данных | Batch Processing | Assess | Для исторических данных и миграции |
| Обработка данных | Data Lakehouse | Adopt | Объединяет преимущества Data Lake и Data Warehouse |
| Хранение данных | Columnar Storage | Adopt | Для аналитических нагрузок |
| Хранение данных | Event Store | Adopt | Хранение событий для аудита и восстановления |
| Хранение данных | Operational DB | Adopt | Для транзакционных систем |
| Интеграция | Event Streaming Platform | Adopt | Замена Camel шины |
| Интеграция | Schema Registry | Adopt | Управление контрактами событий |
| Интеграция | CDC (Change Data Capture) | Trial | Для миграции из легаси-систем |
| Аналитика | Self-service BI | Adopt | Портал самообслуживания для бизнес-пользователей |
| Аналитика | Data Virtualization | Trial | Единый доступ к распределённым данным |
| Аналитика | Data Catalog | Adopt | Поиск и управление метаданными |
| Разработка | Infrastructure as Code | Adopt | Воспроизводимость окружений |
| Разработка | GitOps | Trial | Управление конфигурацией через Git |
| Разработка | Polyglot Persistence | Adopt | Выбор хранилищ под задачи доменов |
| Безопасность | Zero Trust Architecture | Assess | Для медицинских и финансовых данных |
| Безопасность | Confidential Computing | Trial | Обработка чувствительных данных в памяти |
| Безопасность | Attribute-Based Access Control | Adopt | Гибкое управление доступом |

---

## Детализация технологического стека

### Adopt (Внедряем сейчас)
- Apache Kafka — событийная шина  
- Apache Flink — потоковая обработка  
- Apache Iceberg — формат таблиц для Data Lakehouse  
- PostgreSQL — операционные базы доменов  
- ClickHouse — аналитические витрины  
- Power BI — BI инструмент (уже используется)  
- Apache Atlas — каталог данных  
- Terraform — Infrastructure as Code  
- Kubernetes — оркестрация контейнеров  
- AWS/GCP — облачная инфраструктура  

### Trial (Пилотируем в отдельных доменах)
- Apache Pulsar — альтернатива Kafka для геораспределения  
- Materialize — streaming database  
- dbt — трансформации в витринах  
- Prefect/Airflow — оркестрация пайплайнов  
- DataHub — альтернатива Atlas  
- Cube.js — semantic layer для BI  

### Assess (Изучаем)
- Delta Lake — альтернатива Iceberg  
- Apache Pinot — для real-time аналитики  
- Apache Doris — MPP база данных  
- GraphQL для API  
- WebAssembly для edge computing  

### Hold (Не используем / фаза отказа)
- Apache Camel — замена на Kafka  
- SQL Server 2008 — миграция в облако  
- PowerBuilder — переход на веб-интерфейсы  
- Точка-точка интеграции — замена на события  
