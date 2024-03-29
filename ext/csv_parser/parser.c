#include "ruby.h"
#ifdef RUBY_18
  #include "rubyio.h"
#else
  #include "ruby/io.h"
#endif

/* default allocated size is 16 */
#define DEF_ARRAY_LEN 32

static VALUE mPowerCSV;

static VALUE parse(VALUE self, VALUE str)
{
    if (NIL_P(str))
        return Qnil;
    
    const char *ptr = RSTRING_PTR(str);
    int len = (int) RSTRING_LEN(str);  /* cast to prevent warning in 64-bit OS */
    
    VALUE array = rb_ary_new2(DEF_ARRAY_LEN); 
    char value[len];  /* field value, no longer than line */
    int state = 0;
    int index = 0;
    int i;
    char c;
    for (i = 0; i < len; i++)
    {
        c = ptr[i];
        switch (c)
        {
            case ',':
                if (state == 0) {
                    rb_ary_push(array, rb_str_new(value, index));
                    index = 0;
                }
                else if (state == 1) {
                    value[index++] = c;
                }
                else if (state == 2) {
                    rb_ary_push(array, rb_str_new(value, index));
                    index = 0;
                    state = 0;  /* outside quoted */
                }
                break;
            case '"':
                if (state == 0) {
                    state = 1;  /* in quoted */
                }
                else if (state == 1) {
                    state = 2;  /* quote in quoted */
                }
                else if (state == 2) {
                    value[index++] = c;  /* escaped quote */
                    state = 1;  /* in quoted */
                }
                break;
            case 13:  /* \r */
            case 10:  /* \n */
                /* eat it */
                break;
            default:
                value[index++] = c;
        }
    }
    
    rb_ary_push(array, rb_str_new(value, index));
    return array;
}

void Init_csv_parser()
{
    mPowerCSV = rb_define_module("PowerCSV");
    rb_define_module_function(mPowerCSV, "parse", parse, 1);
}
