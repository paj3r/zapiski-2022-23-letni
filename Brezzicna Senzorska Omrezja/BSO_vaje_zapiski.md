# Zapiski BSO vaje

### Časovniki in prekinistve

##### Periodična opravila

```c
void task_function(void *pvParameters){
    static voltile counter;
    while(1)
    {
        // izvajanje opravila
        for(int i=0;i<counter;i++){
        if(counter > 100)
            vTaskDelay(pdMS_TO_TICKS(1000));
        }
    }
}
```

### Programski časovniki

- enkratni (one time timers)

- periodični (auto-reaload timers)

### Prekinitve

prekinitveni strežni program (Interrupt service routine)

- Višna prioriteta kot prioritete opravil

- čim krajše prekinitve

- klici funkcij FreeRTOS API s končnico "FromISR"

#### PSP

procesiranje preloženo na opravilo

- Sinhronizacija z uporabo semaforjev

- Sinhronizacija z uporabo neposredne komunikacije

### Opravilo za provesiranje prekinitve

- sinhronizacija z uporabo semaforjev

- sinhronizacija z uporabo neposredne komunikacije
