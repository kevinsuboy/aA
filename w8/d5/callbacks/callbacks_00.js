class Clock {
    constructor() {
        // 1. Create a Date object.
            // new Date()
        this.date = new Date();
        // 2. Store the hours, minute, and second.
            // builtin: .getHours() .getMinutes() .getSeconds()
        this.hour = this.date.getHours();
        this.minute = this.date.getMinutes();
        this.second = this.date.getSeconds();
        // 3. Call printTime.

        // 4. Schedule the tick at 1 second intervals.
        this._tick = this._tick.bind(this); //! bind f_tick to "THIS" (instance)
        setInterval(this._tick,1000);
        // ! FAIL as of now

        //? b/c setInterval is run in WINDOW scope
        // this._tick returns f _tick()
        
        //when setInterval calls f_tick(), f_tick() has a "THIS"
            //! "THIS" (f_tick()) refers to WINDOW
                //? to fix this, f_tick() needs to bind to BANANA(instance)
            // "THIS" (WINDOW) doesn't have a f printTime()
                // why it fails
                // WINDOW doesn't have direct access to Clock.printTime()
        // this._tick();
    }
    
    printTime(
        /* take in HH MM SS separately OR take in Date OBJ*/
    ) {
        // Format the time in YYYY:MM:DD:HH:MM:SS:mm:
            // concat the str
        console.log(`${this.hour}:${this.minute}:${this.second}`);
        // Use console.log to print it.
    }

    _tick() {
        // 1. Increment the time by one second.
        this.second++;
        if(this.second === 60){
            this.minute++;
            this.second = 1;
        }
        if(this.minute === 60){
            this.hour++;
            this.minute = 1;
        }
        this.hour = this.hour % 24;
        // 2. Call printTime.
        this.printTime();
    }
}

// const clock = new Clock();

const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin
    ,output: process.stdout
});

const addNumbers = function (s, n, cb){
    if (n===0){
        cb(s);
        reader.close();
        return;
    }
    reader.question('Number to sum? ',
        (answer) => {
            let parseInt = Number(answer);
            console.log(`> Partial Sum: ${s+parseInt}`);
            // reader.close();
            addNumbers(s+parseInt,n-1,cb);
        }
    );
}
addNumbers(10, 5, sum => {
    console.log(`Total Sum: ${sum}`)
});


//? reader.question(PROMPT, cb)

//? addNumbers(S, N, cb)
/*    while(N>0){
        S += (user_input) // user_input is 1 value
        N--
    }
    cb(S) // EG sum => console.log();
            // function (sum) { console.log() };
*/
