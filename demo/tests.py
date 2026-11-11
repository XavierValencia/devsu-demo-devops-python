from unittest import mock

from django.db import DatabaseError
from django.test import SimpleTestCase, TestCase
from django.urls import reverse


class TestHealth(TestCase):
    def test_liveness(self):
        response = self.client.get(reverse('health-live'))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {'status': 'ok'})

    def test_readiness(self):
        response = self.client.get(reverse('health-ready'))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {'status': 'ok'})


class TestHealthDatabaseDown(SimpleTestCase):
    def test_readiness_returns_503_when_database_is_unreachable(self):
        with mock.patch('demo.health.connection.ensure_connection', side_effect=DatabaseError):
            response = self.client.get(reverse('health-ready'))
        self.assertEqual(response.status_code, 503)
        self.assertEqual(response.json(), {'status': 'unavailable'})
