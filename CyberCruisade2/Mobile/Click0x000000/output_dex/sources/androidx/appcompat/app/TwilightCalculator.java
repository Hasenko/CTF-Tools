package androidx.appcompat.app;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class TwilightCalculator {
    private static final float ALTIDUTE_CORRECTION_CIVIL_TWILIGHT = -0.10471976f;
    private static final float C1 = 0.0334196f;
    private static final float C2 = 3.49066E-4f;
    private static final float C3 = 5.236E-6f;
    public static final int DAY = 0;
    private static final float DEGREES_TO_RADIANS = 0.017453292f;
    private static final float J0 = 9.0E-4f;
    public static final int NIGHT = 1;
    private static final float OBLIQUITY = 0.4092797f;
    private static final long UTC_2000 = 946728000000L;
    private static TwilightCalculator sInstance;
    public int state;
    public long sunrise;
    public long sunset;

    TwilightCalculator() {
    }

    static TwilightCalculator getInstance() {
        if (sInstance == null) {
            sInstance = new TwilightCalculator();
        }
        return sInstance;
    }

    public void calculateTwilight(long time, double latitude, double longitude) {
        float daysSince2000 = (time - UTC_2000) / 8.64E7f;
        float meanAnomaly = (0.01720197f * daysSince2000) + 6.24006f;
        double d = meanAnomaly;
        double sin = Math.sin(meanAnomaly) * 0.03341960161924362d;
        Double.isNaN(d);
        double trueAnomaly = d + sin + (Math.sin(2.0f * meanAnomaly) * 3.4906598739326E-4d) + (Math.sin(3.0f * meanAnomaly) * 5.236000106378924E-6d);
        double solarLng = 1.796593063d + trueAnomaly + 3.141592653589793d;
        double arcLongitude = (-longitude) / 360.0d;
        double d2 = daysSince2000 - J0;
        Double.isNaN(d2);
        float n = Math.round(d2 - arcLongitude);
        double d3 = J0 + n;
        Double.isNaN(d3);
        double trueAnomaly2 = meanAnomaly;
        double solarTransitJ2000 = d3 + arcLongitude + (Math.sin(trueAnomaly2) * 0.0053d) + (Math.sin(2.0d * solarLng) * (-0.0069d));
        double solarDec = Math.asin(Math.sin(solarLng) * Math.sin(0.4092797040939331d));
        double latRad = 0.01745329238474369d * latitude;
        double cosHourAngle = (Math.sin(-0.10471975803375244d) - (Math.sin(latRad) * Math.sin(solarDec))) / (Math.cos(latRad) * Math.cos(solarDec));
        if (cosHourAngle >= 1.0d) {
            this.state = 1;
            this.sunset = -1L;
            this.sunrise = -1L;
            return;
        }
        if (cosHourAngle <= -1.0d) {
            this.state = 0;
            this.sunset = -1L;
            this.sunrise = -1L;
            return;
        }
        float hourAngle = (float) (Math.acos(cosHourAngle) / 6.283185307179586d);
        double d4 = hourAngle;
        Double.isNaN(d4);
        this.sunset = Math.round((d4 + solarTransitJ2000) * 8.64E7d) + UTC_2000;
        double d5 = hourAngle;
        Double.isNaN(d5);
        long round = Math.round((solarTransitJ2000 - d5) * 8.64E7d) + UTC_2000;
        this.sunrise = round;
        if (round >= time || this.sunset <= time) {
            this.state = 1;
        } else {
            this.state = 0;
        }
    }
}
