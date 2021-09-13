#property strict


class Debug
{
     public:
        template <typename T>
        static void PrintWhen(
            T value,
            int year,
            int mon,
            int day = -1,
            int hour = -1,
            int min = -1);
        
        template <typename T>
        static void PrintWhen(
            T value,
            datetime time);
        
        template <typename T>
        static void PrintWhen(
            T value,
            MqlDateTime &time);
};


template <typename T>
static void Debug::PrintWhen(
    T value,
    int year,
    int mon,
    int day = -1,
    int hour = -1,
    int min = -1)
{
    MqlDateTime now;
    TimeCurrent(now);
    
    if (now.year != year) {
        return;
    }
    if (now.mon != mon) {
        return;
    }
    if (day >= 1 && now.day != day) {
        return;
    }
    if (hour >= 0 && now.hour != hour) {
        return;
    }
    if (min >= 0 && now.min != min) {
        return;
    }

    Print(value);
}


template <typename T>
static void Debug::PrintWhen(T value, datetime time)
{
    if (TimeCurrent() != time) {
        return;
    }

    Print(value);
}


template <typename T>
static void Debug::PrintWhen(T value, MqlDateTime &time)
{
    MqlDateTime now;
    TimeCurrent(now);
    
    if (now.year != time.year) {
        return;
    }
    if (now.mon != time.mon) {
        return;
    }
    if (now.day != time.day) {
        return;
    }
    if (now.hour != time.hour) {
        return;
    }
    if (now.min != time.min) {
        return;
    }

    Print(__FUNCTION__, " value:", value);
}
