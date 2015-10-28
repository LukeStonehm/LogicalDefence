package za.co.lukestonehm.logicaldefence;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;

public class HttpAsync extends AsyncTask<String, String, String> {
    Context c;
    CallbackListener mListener;

    public HttpAsync(Context c) {
        this.c = c;
    }

    @Override
    protected String doInBackground(String... args) {
        try {
            URL uri = new URL(args[0]);
            HttpGet request = new HttpGet(uri.toString());

            DefaultHttpClient httpClient = new DefaultHttpClient();
            HttpContext localContext = new BasicHttpContext();

            HttpResponse response = httpClient.execute(request, localContext);

            return processResponse(response);
        } catch (IOException e) {
            Log.d(MainActivity.TAG, e.getMessage());
        }
        return null;
    }

    @Override
    protected void onPostExecute(String result) {
        mListener.httpResult(result);
    }

    public void setListener(CallbackListener listener) {
        mListener = listener;
    }

    private String processResponse(HttpResponse response) {
        try {
            InputStream in = response.getEntity().getContent();
            Reader r = new InputStreamReader(in);
            BufferedReader br = new BufferedReader(r);

            String s = br.readLine();

            return s;
        } catch (IllegalStateException e) {
            return e.getMessage();
        } catch (IOException e) {
            return e.getMessage();
        }
    }
}
