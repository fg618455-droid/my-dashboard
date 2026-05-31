-- 1. TODOS TABLE
CREATE TABLE IF NOT EXISTS todos (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    date_str TEXT NOT NULL,
    text TEXT NOT NULL,
    done BOOLEAN DEFAULT FALSE,
    queued BOOLEAN DEFAULT FALSE,
    done_at BIGINT
);

-- 2. WATER LOGS TABLE
CREATE TABLE IF NOT EXISTS water_logs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    date_str TEXT NOT NULL,
    amount_ml INT NOT NULL
);

-- 3. SUPPLEMENTS TABLE
CREATE TABLE IF NOT EXISTS supplements (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    time_window TEXT NOT NULL,
    start_hour INT NOT NULL,
    end_hour INT NOT NULL,
    is_low BOOLEAN DEFAULT FALSE
);

-- 4. WEIGHT LOGS TABLE
CREATE TABLE IF NOT EXISTS weight_logs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    date_str TEXT NOT NULL UNIQUE,
    weight_kg NUMERIC(5,2) NOT NULL,
    photo_url TEXT
);

-- 5. WORKOUT LOGS TABLE
CREATE TABLE IF NOT EXISTS workout_logs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    date_str TEXT NOT NULL,
    location TEXT NOT NULL,
    split_name TEXT NOT NULL,
    exercise_name TEXT NOT NULL,
    weight_kg NUMERIC(5,2) NOT NULL,
    reps INT NOT NULL,
    completed BOOLEAN DEFAULT TRUE
);

-- 6. FINANCES TABLE
CREATE TABLE IF NOT EXISTS finance_accounts (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    balance NUMERIC(12,2) DEFAULT 0.00,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 7. SUBSCRIPTIONS TABLE
CREATE TABLE IF NOT EXISTS subscriptions (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    renewal_day INT NOT NULL,
    last_deducted_month TEXT
);

-- 8. HABITS TABLE (Habit Tracker)
CREATE TABLE IF NOT EXISTS habits (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    emoji TEXT DEFAULT '✓',
    color TEXT DEFAULT '#6BE3A4'
);

-- 9. HABIT LOGS TABLE
CREATE TABLE IF NOT EXISTS habit_logs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    habit_id UUID REFERENCES habits(id) ON DELETE CASCADE,
    date_str TEXT NOT NULL,
    UNIQUE(habit_id, date_str)
);

-- 10. DAILY REFLECTIONS TABLE
CREATE TABLE IF NOT EXISTS daily_reflections (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    date_str TEXT NOT NULL UNIQUE,
    mood_score INT NOT NULL CHECK (mood_score BETWEEN 1 AND 5),
    note TEXT
);

-- 11. HEALTH LOGS (Apple Health / Cal Plus Bridge)
CREATE TABLE IF NOT EXISTS health_logs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    date_str TEXT NOT NULL UNIQUE,
    calories_in NUMERIC(7,1),
    calories_burned NUMERIC(7,1),
    steps INT,
    sleep_hours NUMERIC(4,2),
    hrv NUMERIC(6,2),
    active_minutes INT,
    synced_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 12. GRADES (Noten-Tracker)
CREATE TABLE IF NOT EXISTS grades (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    subject TEXT NOT NULL,
    value NUMERIC(3,2) NOT NULL,
    weight INT DEFAULT 1,
    date_str TEXT NOT NULL
);

-- 13. EXAMS (Prüfungs-Countdown)
CREATE TABLE IF NOT EXISTS exams (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    subject TEXT NOT NULL,
    exam_date TEXT NOT NULL
);

-- 14. HOMEWORK (Hausaufgaben)
CREATE TABLE IF NOT EXISTS homework (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    task TEXT NOT NULL,
    due_date TEXT,
    done BOOLEAN DEFAULT FALSE
);
